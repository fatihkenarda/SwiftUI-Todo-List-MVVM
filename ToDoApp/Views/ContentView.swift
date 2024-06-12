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
        ZStack {
            if listViewModel.items.isEmpty {
                NoItemsView()
                    .transition(AnyTransition.opacity.animation(.easeIn))
            }
            else {
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
                .listStyle(PlainListStyle())
            }
        }
        .navigationTitle("TEXT_TODO_PLACEHOLDER")
        .navigationBarItems(
            leading: EditButton(),
            trailing: NavigationLink("NAVIGATION_ADD_BUTTON_PLACEHOLDER", destination: AddView()))
    }
}


#Preview {
    NavigationView{
        ContentView()
    }
    .environmentObject(ListViewModel())
}
