//
//  ToDoListitemsView.swift
//  ToDoList
//
//  Created by Tolga Sarikaya on 08.05.23.
//
import FirebaseFirestoreSwift
import SwiftUI

struct ToDoListView: View {
    @StateObject var viewModel : ToDoListViewViewModel
    @FirestoreQuery var items: [ToDoListitem]
    
    
    
    
    init(userId: String) {
        // users/<id>/todos/<entries>
        self._items = FirestoreQuery(collectionPath: "users/\(userId)/todos"
        )
    
        self._viewModel = StateObject(wrappedValue: ToDoListViewViewModel(userId: userId)
        )
}
    
    var body: some View {
        NavigationView {
            VStack {
                List(items) { item in
                    ToDoListitemView(item: item)
                        .swipeActions {
                            Button("Delete") {
                                viewModel.delete(id: item.id)
                            }
                            .tint(.red)

                        }
                }
                .listStyle(PlainListStyle())
            }
            .navigationTitle("To Do List")
            .toolbar {
                Button {
                    // Action
                    viewModel.showingNewItemView = true
                } label: {
                    Image(systemName: "plus")
                }
            }
            .sheet(isPresented: $viewModel.showingNewItemView) {
                NewitemView(newItemPresented: $viewModel.showingNewItemView)
            }
        }
    }
}

struct ToDoListitemsView_Previews: PreviewProvider {
    static var previews: some View {
        ToDoListView(userId: "gkKfZfebu1di4owbLvRmOgvxUJo2P")
    }
}
