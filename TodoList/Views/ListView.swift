//
//  ListView.swift
//  TodoList
//
//  Created by Emili Sharpinska on 25/02/2026.
//

import SwiftUI

struct ListView: View {
    
   
    @EnvironmentObject var listViewModel: ListViewModel
    
    
    var body: some View {
        ZStack{
            if listViewModel.items.isEmpty{
                NoItemsView()
                    .transition(
                        AnyTransition.opacity.animation(.easeInOut)
                    )
            } else {
                List{
                    ForEach(listViewModel.items){ item in
                        ListRowView(item: item)
                            .onTapGesture {
                                withAnimation(.spring){
                                    listViewModel.updateItem(item: item)
                                }
                            }
                    }
                    .onDelete(perform: listViewModel.deleteItem)
                    .onMove(perform: listViewModel.moveItems)
                }
            }
        }
        
        .navigationTitle("Todo List 💕")
        .toolbar {
            ToolbarItem(placement: .topBarLeading) {
                EditButton()
            }
            ToolbarItem(placement: .topBarTrailing) {
                NavigationLink("Add") {
                    AddView()
                }
            }
        }
    }
   
}


#Preview {
    NavigationView{
        ListView()
    }
    .environmentObject(ListViewModel())
}
