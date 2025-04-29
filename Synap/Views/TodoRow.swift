//
//  TodoRow.swift
//  Synap
//
//  Created by Eric Klaesson on 28/4/25.
//

import SwiftUI

struct TodoRow: View {
    @Bindable var todo: Todo
    
    var body: some View {
        HStack {
            TodoToggle(isOn: $todo.isDone)
//            Image(systemName : todo.isDone ? "circle.checkMark" : "circle")
//                .foregroundStyle(todo.isDone ? .green : .gray)
            VStack(alignment: .leading) {
                Text(todo.title)
                Text(todo.creationDate, format: Date.FormatStyle(date: .numeric, time: .standard))
            }
        }
    }
}

#Preview {
    var todo = Todo(title: "Title")
    todo.isDone = true
    return TodoRow(todo: todo)
}
