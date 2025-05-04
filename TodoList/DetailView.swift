//
//  DetailView.swift
//  TodoList
//
//  Created by 湯川昇平 on 2025/04/29.
//

import SwiftUI

struct DetailView: View {
    @Binding var task: Task
    
    var body: some View {
        VStack(alignment: .leading) {
            TextField("タスクタイトル", text: $task.title)
                .textFieldStyle(.roundedBorder)
                .padding()
            
            Toggle("完了", isOn: $task.isCompleted) // Toggle で完了状態を切り替え
                .padding()
            
            Spacer()
        }
        .navigationTitle("タスク編集")
    }
}
