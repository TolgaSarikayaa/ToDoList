//
//  LoginViewViewModel.swift
//  ToDoList
//
//  Created by Tolga Sarikaya on 08.05.23.
//
import FirebaseAuth
import Foundation

class LoginViewViewModel: ObservableObject {
    @Published var email = ""
    @Published var password = ""
    @Published var erroMessage = ""
    
    
    init() {}
    
    func login() {
        guard validate() else {
            return
        }
        
        // Try log in
        Auth.auth().signIn(withEmail: email, password: password)
    }
    
    func validate() -> Bool {
        erroMessage = ""
        guard !email.trimmingCharacters(in: .whitespaces).isEmpty,
              !password.trimmingCharacters(in: .whitespaces).isEmpty else {
            erroMessage = "Password fill in all fields"
            return false
        }
        
        guard email.contains("@") && email.contains(".") else {
            erroMessage = "Please enter valid email."
            return false
        }
        
        return true

    }
}
