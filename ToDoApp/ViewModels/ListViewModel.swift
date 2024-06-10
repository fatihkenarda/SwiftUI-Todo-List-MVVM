//
//  ListViewModel.swift
//  ToDoApp
//
//  Created by Fatih Kenarda on 10.06.2024.
//

import Foundation

class ListViewModel: ObservableObject {
    
    @Published var items: [ItemModel] = []
    
    init(){
        getItems()
    }
    
    func getItems(){
        let newItems = [
            ItemModel(title: "This is first title", isCompleted: false),
            ItemModel(title: "This is second title", isCompleted: true),
            ItemModel(title: "This is third title", isCompleted: false)
        ]
        items.append(contentsOf: newItems)
    }
    
    func deleteItem(indexSet: IndexSet) {
        items.remove(atOffsets: indexSet)
    }
    
    func moveItem(indices: IndexSet, newOffset: Int) {
        items.move(fromOffsets: indices, toOffset: newOffset)
    }
    
    func addItem(title: String){
        let newItem = ItemModel(title: title, isCompleted: false)
        items.append(newItem)
    }
    
    func updateItem(item: ItemModel){
        if let index = items.firstIndex(where: { $0.id == item.id }) {
            items[index] = item.updateCompletion()
        }
    }
}
