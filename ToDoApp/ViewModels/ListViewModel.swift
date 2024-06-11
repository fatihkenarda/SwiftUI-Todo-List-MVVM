//
//  ListViewModel.swift
//  ToDoApp
//
//  Created by Fatih Kenarda on 10.06.2024.
//

import Foundation

class ListViewModel: ObservableObject {
    
    @Published var items: [ItemModel] = []{
        didSet{
            saveItem()
        }
    }
    let itemKey: String = "itemKey"
    
    init(){
        getItems()
    }
    
    func getItems(){
        guard 
            let data = UserDefaults.standard.data(forKey: itemKey),
            let saveItem = try? JSONDecoder().decode([ItemModel].self, from: data)
        else {return}
        
        items.self = saveItem
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
    
    func saveItem(){
        if let encodedData = try? JSONEncoder().encode(items) {
            UserDefaults.standard.set(encodedData, forKey: itemKey)
        }
    }
}
