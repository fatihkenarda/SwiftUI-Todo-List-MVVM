//
//  NoItemsView.swift
//  ToDoApp
//
//  Created by Fatih Kenarda on 11.06.2024.
//

import SwiftUI

struct NoItemsView: View {
    @State var animate: Bool = false
    let secondaryColor = Color("SecondaryColor")
    let accentColor = Color("AccentColor")
    
    var body: some View {
        ZStack {
//            AngularGradient(
//                gradient: Gradient(colors: [Color(#colorLiteral(red: 0.2588235438, green: 0.7568627596, blue: 0.9686274529, alpha: 1)), Color(#colorLiteral(red: 0.9607843161, green: 0.7058823705, blue: 0.200000003, alpha: 1))]),
//                center: .topLeading,
//                angle: .degrees(180 + 45)
//            )
//            .ignoresSafeArea(.all)
            VStack {
                ScrollView{
                    VStack(spacing: 10) {
                        Text("TEXT_PLACEHOLDER")
                            .font(.title2)
                            .fontWeight(.semibold)
                        Text("TEXT_DESC_PLACEHOLDER")
                        NavigationLink(
                            destination: AddView(),
                            label: {
                                Text("ADD_BUTTON_PLACEHOLDER")
                                    .foregroundColor(.white)
                                    .font(.headline)
                                    .frame(maxWidth: .infinity)
                                    .frame(height: 50)
                                    .background(animate ? secondaryColor : accentColor)
                                    .cornerRadius(10)
                            })
                        .padding(.all)
                            .padding(.horizontal, animate ? 30 : 50)
                            .scaleEffect(animate ? 1.1 : 1.0)
                            .offset(y: animate ? -10 : 0)
                            .shadow(
                                color: animate ? secondaryColor.opacity(0.9) : accentColor.opacity(0.9),
                                radius: animate ? 30 : 10,
                                x: 0,
                                y: animate ? 30 : 15)
                    }
                    .frame(maxWidth: 500)
                    .multilineTextAlignment(.center)
                    .padding(50)
                    .onAppear(perform: addAnimation)
                }
                .frame(maxWidth: /*@START_MENU_TOKEN@*/.infinity/*@END_MENU_TOKEN@*/, maxHeight: /*@START_MENU_TOKEN@*/.infinity/*@END_MENU_TOKEN@*/)
            }
        }

    }
    
    func addAnimation(){
        guard !animate else {return}
        DispatchQueue.main.asyncAfter(deadline:.now() + 1.5){
            withAnimation(
                Animation
                    .easeInOut(duration: 2.0)
                    .repeatForever()
            ){
                animate.toggle()
            }
        }
    }
}

#Preview {
    NavigationView {
        NoItemsView()
            .navigationTitle("TEXT_TODO_PLACEHOLDER")
    }
    
}
