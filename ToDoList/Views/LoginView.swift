//
//  LoginView.swift
//  ToDoList
//
//  Created by Tolga Sarikaya on 08.05.23.
//

import SwiftUI

struct LoginView: View {
    
   @StateObject var viewModel = LoginViewViewModel()
    
    var body: some View {
        NavigationStack {
            VStack {
                // Header
                HeaderView(title: "To Do List", subtitle: "Get things done", angle: 15, background: .pink)
              
                
                Form {
                    
                    if !viewModel.erroMessage.isEmpty {
                        Text(viewModel.erroMessage)
                            .foregroundColor(.red)
                    }
                    
                    TextField("Email Address", text: $viewModel.email)
                        .textFieldStyle(DefaultTextFieldStyle())
                        .autocapitalization(.none)
                    SecureField("Password", text: $viewModel.password)
                        .textFieldStyle(DefaultTextFieldStyle())
                    
                    TLButton(title: "Log In", background: .blue
                    ){
                        // Attempt log in
                        viewModel.login()
                    }
                    .padding()
                    
                    
                }
                .offset(y: -50)
                
                
                // Create Account
                VStack {
                    Text("New around here?")
                   
                    NavigationLink("Create An Account", destination: RegisterView())
                }
                .padding(.bottom, 50)
                
                Spacer()
            }
        }
    }
}

struct LoginView_Previews: PreviewProvider {
    static var previews: some View {
        LoginView()
    }
}
