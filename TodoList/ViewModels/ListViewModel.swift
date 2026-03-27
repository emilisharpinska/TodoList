//
//  ListViewModel.swift
//  TodoList
//
//  Created by Emili Sharpinska on 26/02/2026.
//

import Foundation
import SwiftUI
internal import Combine

class ListViewModel: ObservableObject{
    @Published var items: [ItemModel] = []{
        didSet {
            saveItems()
        }
    }
    let itemsKey: String = "items_list"
    
    init(){
        getItems()
    }
    
    func getItems() {
        guard
            let data = UserDefaults.standard.data(forKey: itemsKey),
            let savedItems = try? JSONDecoder().decode([ItemModel].self, from: data)
        else {return}
        
        self.items = savedItems
        
//        let newItems = [
//            ItemModel(title: "Clean Room", isComplited: false),
//            ItemModel(title: "Studying for 6 hours", isComplited: true)
//        ]
//        items.append(contentsOf: newItems)
    }
    
    func deleteItem(indexSet: IndexSet){
        items.remove(atOffsets: indexSet)
    }
    
    func moveItems(from: IndexSet, to: Int){
        items.move(fromOffsets: from, toOffset: to)
    }
    
    func addItem(title: String){
        let newItem = ItemModel(title: title, isComplited: false)
        items.append(newItem)
    }
    
    func updateItem(item: ItemModel){
//        if let index = items.firstIndex(where: { (existingModel) -> Bool in
//            return existingModel.id == item.id
//        }) {
//            
//        }
//        
        if let index = items.firstIndex(where: {$0.id == item.id}){
            items[index] = item.updateCompletion()
        }
    }
    
    func saveItems(){
        if let encodableItem = try? JSONEncoder().encode(items){
            UserDefaults.standard.set(encodableItem, forKey: itemsKey)
        }
    }
}
