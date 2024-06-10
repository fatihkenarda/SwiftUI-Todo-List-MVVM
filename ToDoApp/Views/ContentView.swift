//
//  ContentView.swift
//  ToDoApp
//
//  Created by Fatih Kenarda on 6.06.2024.
//

import SwiftUI

struct ContentView: View {
    
    @EnvironmentObject var listViewModel: ListViewModel
    
    var body: some View {
        List{
            ForEach(listViewModel.items){ item in
                ListRowView(item: item)
                    .onTapGesture {
                        withAnimation(.linear){
                            listViewModel.updateItem(item: item)
                        }
                    }
            }
            .onDelete(perform: listViewModel.deleteItem)
            .onMove(perform: listViewModel.moveItem)
        }
        .navigationTitle("Todo List 📝")
        .navigationBarItems(
            leading: EditButton(),
            trailing: NavigationLink("Add", destination: AddView())
        )
    }
}


#Preview {
    NavigationView{
        ContentView()
    }
    .environmentObject(ListViewModel())
}
