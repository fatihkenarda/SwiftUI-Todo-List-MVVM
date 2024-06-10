//
//  ListRowView.swift
//  ToDoApp
//
//  Created by Fatih Kenarda on 6.06.2024.
//

import SwiftUI

struct ListRowView: View {
    
    var item : ItemModel
    var body: some View {
        HStack{
            Image(systemName: item.isCompleted ? "checkmark.circle" : "circle")
                .foregroundColor(item.isCompleted ? .green : .red)
            Text(item.title)
            Spacer()
        }
        .padding(.vertical, 8)
        .font(.title2)
    }
}

#Preview {
    Group{
        ListRowView(item: ItemModel(title: "first", isCompleted: true))
        ListRowView(item: ItemModel(title: "second", isCompleted: false))
    }
}
