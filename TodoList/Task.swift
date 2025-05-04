//
//  Task.swift
//  TodoList
//
//  Created by 湯川昇平 on 2025/04/29.
//

import Foundation

struct Task: Identifiable, Codable { // Identifiableプロトコルに準拠
    let id = UUID() // 各タスクに固有のIDを自動生成
    var title: String // タスクの内容 (変更可能なので var)
    var isCompleted: Bool // 完了したかどうか (変更可能なので var)
}
