//
//  ToDoListitemViewViewModel.swift
//  ToDoList
//
//  Created by Tolga Sarikaya on 08.05.23.
//
import FirebaseAuth
import FirebaseFirestore
import Foundation

// ViewModel for single to do list item view(each row in items list)
class ToDoListitemViewViewModel: ObservableObject {
    
    init() {}
    
    func toggleIsDone(item: ToDoListitem) {
        var itemCopy = item
        itemCopy.setDone(!item.isDone)
        
        guard let uid = Auth.auth().currentUser?.uid else {
            return
        }
        
        let db = Firestore.firestore()
        db.collection("users")
            .document(uid)
            .collection("todos")
            .document(itemCopy.id)
            .setData(itemCopy.asDictionary())
        
    }
}
