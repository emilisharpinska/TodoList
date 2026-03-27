//
//  ListRowView.swift
//  TodoList
//
//  Created by Emili Sharpinska on 25/02/2026.
//

import SwiftUI

struct ListRowView: View {
    
    let item: ItemModel
    
    var body: some View {
        HStack{
            Image(systemName: item.isComplited ? "checkmark.circle" : "circle")
                .foregroundColor(item.isComplited ? .green : .red)
            Text(item.title)
            Spacer()
        }
        .font(.title2)
        .padding(.vertical, 8)
    }
}

var item1 = ItemModel(title: "jsdiahshha", isComplited: false)
var item2 = ItemModel(title: "jsdoasj", isComplited: true)

#Preview(traits: .sizeThatFitsLayout) {
        ListRowView(item: item1)
        
}

#Preview (traits: .sizeThatFitsLayout){
        ListRowView(item: item2)
}
