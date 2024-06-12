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
                TextField("TEXT_TEXTFIELD_PLACEHOLDER", text: $textFieldText)
                    .padding(.horizontal)
                    .frame(height: 55)
                    .background(Color(UIColor.secondarySystemBackground))
                    .cornerRadius(10)
                
                Button(action: {
                    saveButtonPressed()
                }, label: {
                    Text("TEXT_SAVE_PLACEHOLDER")
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
        .navigationTitle("TEXT_AN_ITEM_PLACEHOLDER")
        .alert(isPresented: $showAlert, content: {
            Alert(title: Text("TEXT_ALERT_PLACEHOLDER"))
        })
    }
    
    func saveButtonPressed(){
        if (textFieldText.count < 3) {
            showAlert.toggle()
        }
        else {
            listViewModel.addItem(title: textFieldText)
            presentationMode.wrappedValue.dismiss()
        }
    }
    
//    func textIsAppropriate() -> Bool {
//        if(textFieldText.count < 3){
//            showAlert.toggle()
//            alertTitle = "TEXT_ALERT_PLACEHOLDER"
//            return false
//        }
//        return true
//    }
    
//    func getAlert() -> Alert{
//        Alert(title: Text(alertTitle))
//    }
}

#Preview {
    NavigationView {
        AddView()
    }
}
