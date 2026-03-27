//
//  ItemModel.swift
//  TodoList
//
//  Created by Emili Sharpinska on 25/02/2026.
//

import Foundation


struct ItemModel : Identifiable, Codable{
    let id: String
    let title: String
    let isComplited: Bool
    
    init(id: String = UUID().uuidString, title: String, isComplited: Bool){
        self.id = id
        self.title = title
        self.isComplited = isComplited
    }
    
    func updateCompletion() -> ItemModel {
        return ItemModel(id: id, title: title, isComplited: !isComplited)
    }
}
