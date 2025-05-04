//
//  ContentView.swift
//  TodoList
//
//  Created by 湯川昇平 on 2025/04/29.
//

import SwiftUI

struct ContentView: View {
    
    @AppStorage("tasks") private var tasks: [Task] = []
    @State private var newTaskTitle: String = ""
    
    var body: some View {
        NavigationView {
            VStack {
                HStack {
                    TextField("新しいタスクを入力", text: $newTaskTitle)
                        .textFieldStyle(.roundedBorder)
                    
                    Button("追加") {
                        addTask()
                    }
                    .disabled(newTaskTitle.isEmpty)
                }
                .padding()
                
                List {
                    
                    ForEach($tasks) { $task in
                        NavigationLink(destination: DetailView(task: $task)) {
                            HStack {
                                Image(systemName: task.isCompleted ? "checkmark.circle.fill" : "circle")
                                    .onTapGesture {
                                        task.isCompleted.toggle()
                                    }
                                Text(task.title)
                                    .strikethrough(task.isCompleted, color: .gray)
                                    .foregroundColor(task.isCompleted ? .gray : .primary)
                            }
                        }
                    }
                    .onDelete(perform: deleteTask)
                }
                
            }
            .navigationTitle("今日のタスク")
            .onAppear {
                
                if tasks.isEmpty {
                    
                }
            }
        }
    }
    
    private func addTask() {
        guard !newTaskTitle.isEmpty else { return }
        
        let newTask = Task(title: newTaskTitle, isCompleted: false)
        tasks.append(newTask)
        newTaskTitle = ""
    }
    
    private func deleteTask(at offsets: IndexSet) {
        tasks.remove(atOffsets: offsets)
    }
}

extension Array: @retroactive RawRepresentable where Element: Codable {
    public init?(rawValue: String) {
        guard let data = rawValue.data(using: .utf8),
              let result = try? JSONDecoder().decode([Element].self, from: data)
        else {
            return nil
        }
        self = result
    }
    
    public var rawValue: String {
        guard let data = try? JSONEncoder().encode(self),
              let result = String(data: data, encoding: .utf8)
        else {
            return "[]"
        }
        return result
    }
}

#Preview {
    ContentView()
}
