//
//  ToDoListitem.swift
//  ToDoList
//
//  Created by Tolga Sarikaya on 08.05.23.
//

import Foundation

struct ToDoListitem: Codable, Identifiable {
    let id: String
    let title: String
    let dueDate: TimeInterval
    let createdDate: TimeInterval
    var isDone: Bool
    
    mutating func setDone(_ state: Bool) {
        isDone = state
    }
}
