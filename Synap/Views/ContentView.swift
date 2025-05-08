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
    @State var showCompleted = false
    
    // Get incomplete trackers
    @Query(
        filter: #Predicate<Tracker> { tracker in
            !tracker.isCompleted
        },
        sort: [
            .init(\Tracker.creationDate, order: .reverse),
            .init(\Tracker.title)
        ],
        animation: .bouncy) private var todos: [Tracker]
    
    // Get completed trackers
    @Query(
        filter: #Predicate<Tracker> { tracker in
            tracker.isCompleted
        },
        sort: [
            .init(\Tracker.creationDate, order: .reverse),
            .init(\Tracker.title)
        ],
        animation: .bouncy) private var dones: [Tracker]
    
    var body: some View {
        NavigationSplitView {
            List {
                ForEach(todos) { todo in
                    NavigationLink {
                        TrackerDetailView(tracker: todo)
                    } label: {
                        TrackerRow(tracker: todo)
                    }
                }
                .onDelete(perform: deleteItems)
                
                if(showCompleted && !dones.isEmpty) {
                    Section("Completed") {
                        ForEach(dones) { done in
                            NavigationLink {
                                TrackerDetailView(tracker: done)
                            } label: {
                                TrackerRow(tracker: done)
                            }
                        }
                        .onDelete(perform: deleteItems)
                    }
                }
                
            }
            .toolbar {
                ToolbarItem {
                    Toggle("Show Completed", isOn: $showCompleted)
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
            .navigationTitle("Trackers")
            
            
        } detail: {
            Text("Select an item")
        }
    }

    private func addItem() {
        let newItem = Tracker(title: "Title")
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
        for: Tracker.self,
        configurations: ModelConfiguration(isStoredInMemoryOnly: true)
    )

    let context = modelContainer.mainContext

    var tracker1 = Tracker(title: "Preview Task 1")
    context.insert(tracker1)
    
    var tracker2 = Tracker(title: "Preview Task 2")
    context.insert(tracker2)
    
    return ContentView()
        .modelContainer(modelContainer)
}
