//
//  ContentView.swift
//  Synap
//
//  Created by Eric Klaesson on 17/4/25.
//

import SwiftUI
import SwiftData

struct ContentView: View {
    @Environment(\.modelContext) private var modelContext
    @State var showAll = false
    
    @Query(
        filter: #Predicate<Todo> { todo in
            !todo.isDone
        },
        sort: [
            .init(\Todo.creationDate, order: .reverse),
            .init(\Todo.title)
        ],
        animation: .bouncy) private var todos: [Todo]
    
    @Query(
        filter: #Predicate<Todo> { todo in
            todo.isDone
        },
        sort: [
            .init(\Todo.creationDate, order: .reverse),
            .init(\Todo.title)
        ],
        animation: .bouncy) private var dones: [Todo]
    
    var body: some View {
        NavigationSplitView {
            List {
                ForEach(todos) { todo in
                    NavigationLink {
                        TodoDetailView(todo: todo)
                    } label: {
                        TodoRow(todo: todo)
                    }
                }
                .onDelete(perform: deleteItems)
                
                if(showAll && !dones.isEmpty) {
                    Section("Completed") {
                        ForEach(dones) { done in
                            NavigationLink {
                                TodoDetailView(todo: done)
                            } label: {
                                TodoRow(todo: done)
                            }
                        }
                        .onDelete(perform: deleteItems)
                    }
                }
                
            }
            .toolbar {
                ToolbarItem {
                    Toggle("Show all", isOn: $showAll)
                }
                ToolbarItem(placement: .navigationBarTrailing) {
                    EditButton()
                }
                ToolbarItem {
                    Button(action: addItem) {
                        Label("Add Item", systemImage: "plus")
                    }
                }
            }
            .navigationTitle("Todo list")
            
            
        } detail: {
            Text("Select an item")
        }
    }

    private func addItem() {
        let newItem = Todo(title: "Title")
        modelContext.insert(newItem)
    }

    private func deleteItems(offsets: IndexSet) {
        for index in offsets {
            modelContext.delete(todos[index])
        }
    }
}

#Preview {
    let modelContainer = try! ModelContainer(
        for: Todo.self,
        configurations: ModelConfiguration(isStoredInMemoryOnly: true)
    )

    let context = modelContainer.mainContext

    context.insert(Todo(title: "Preview Task 1"))
    context.insert(Todo(title: "Preview Task 2"))
    
    return ContentView()
        .modelContainer(modelContainer)
}
