//
//  AddView.swift
//  ToDoApp
//
//  Created by Fatih Kenarda on 6.06.2024.
//

import SwiftUI

struct AddView: View {
    @State var textFieldText: String = ""
    @EnvironmentObject var listViewModel: ListViewModel
    @Environment(\.presentationMode) var presentationMode
    @State var alertTitle: String = ""
    @State var showAlert: Bool = false
    
    var body: some View {
        ScrollView {
            VStack {
                TextField("Type something here...", text: $textFieldText)
                    .padding(.horizontal)
                    .frame(height: 55)
                    .background(Color.white)
                    .cornerRadius(10)
                
                Button(action: {
                    saveButtonPressed()
                }, label: {
                    Text("Save".uppercased())
                        .font(.headline)
                        .frame(maxWidth: .infinity)
                        .frame(height: 55)
                        .background(Color.accentColor)
                        .foregroundColor(.white)
                        .cornerRadius(10)
                })
            }
            .padding(.all)
        }
        .navigationTitle("Add an Item ✎")
        .alert(isPresented: $showAlert, content: getAlert)
    }
    
    func saveButtonPressed(){
        if textIsAppropriate() {
            listViewModel.addItem(title: textFieldText)
            presentationMode.wrappedValue.dismiss()
        }
    }
    
    func textIsAppropriate() -> Bool {
        if(textFieldText.count < 3){
            showAlert.toggle()
            alertTitle = "Item must be at Least 3 characters long !"
            return false
        }
        return true
    }
    
    func getAlert() -> Alert{
        return Alert(title: Text(alertTitle))
    }
}

#Preview {
    NavigationView {
        AddView()
    }
}
