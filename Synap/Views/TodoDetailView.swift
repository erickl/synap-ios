//
//  TodoDetailView.swift
//  Synap
//
//  Created by Eric Klaesson on 28/4/25.
//

import SwiftUI

struct TodoDetailView: View {
    @Bindable var todo: Todo
    
    var body: some View {
        VStack {
            TextField("New todo", text: $todo.title)
            Image(systemName: todo.isDone ? "checkmark.circle.fill" : "circle")
                .foregroundStyle(todo.isDone ? .green : .gray)
        }
        .padding()
    }
}

#Preview {
    var todo = Todo(title: "Title")
    todo.isDone = true
    return TodoDetailView(todo: todo)
}
