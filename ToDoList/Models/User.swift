//
//  User.swift
//  ToDoList
//
//  Created by Tolga Sarikaya on 08.05.23.
//

import Foundation

struct User: Codable {
    let id: String
    let name: String
    let email: String
    let joined: TimeInterval
}
