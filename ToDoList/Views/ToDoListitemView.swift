//
//  ToDoListitemView.swift
//  ToDoList
//
//  Created by Tolga Sarikaya on 08.05.23.
//

import SwiftUI

struct ToDoListitemView: View {
    @StateObject var viewModel = ToDoListitemViewViewModel()
    let item: ToDoListitem
    
    
    var body: some View {
        HStack {
            VStack(alignment: .leading) {
                Text(item.title)
                    .font(.body)
                    
                Text("\(Date(timeIntervalSince1970: item.dueDate).formatted(date: .abbreviated, time: .shortened))")
                    .font(.footnote)
                    .foregroundColor(Color(.secondaryLabel))
            }
            Spacer()
            
            Button {
                viewModel.toggleIsDone(item: item)
            } label: {
                Image(systemName: item.isDone ? "checkmark.circle.fill" : "circle")
                    .foregroundColor(Color.blue)
            }
        }
    }
}

struct ToDoListitemView_Previews: PreviewProvider {
    static var previews: some View {
        ToDoListitemView(item: .init(id: "123", title: "Get milk", dueDate: Date().timeIntervalSince1970, createdDate: Date().timeIntervalSince1970, isDone: true))
    }
}
