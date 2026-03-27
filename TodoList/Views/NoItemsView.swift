//
//  NoItemsView.swift
//  TodoList
//
//  Created by Emili Sharpinska on 26/02/2026.
//

import SwiftUI

struct NoItemsView: View {
    
    @State var animated: Bool = false
    @State var secondaryAccentColor = Color("SecondaryAccentColor")
    
    var body: some View {
        ScrollView{
            VStack(spacing: 10){
                Text("There are no items!")
                    .font(.title)
                    .fontWeight(.semibold)
                Text("Are you a productive person? I think you should click the add button and add a bunch of items to your todo list!")
                    .padding(.bottom, 20)
                
                NavigationLink {
                    AddView()
                } label: {
                    Text("Add Something 😍")
                        .foregroundColor(.white)
                        .font(.headline)
                        .frame(height: 55, alignment: .center)
                        .frame(maxWidth: .infinity)
                        .background(animated ? secondaryAccentColor : Color.accentColor)
                        .cornerRadius(10)
                }
                .padding(.horizontal, animated ? 30 : 50)
                .scaleEffect(animated ? 1.1 : 1.0)
                .offset(y: animated ? -7 : 0)
                .shadow(color: animated ? secondaryAccentColor: Color.accentColor,
                        radius: animated ? 30 : 10,
                        x: 0,
                        y: animated ? 40 : 30)

            }
            .frame(maxWidth: 400)
            .padding(40)
            .multilineTextAlignment(.center)
            .onAppear(perform: addAnimation)
        }
        .frame(maxWidth: .infinity, maxHeight: .infinity)
    }
    
    func addAnimation(){
        guard !animated else {return}
        DispatchQueue.main.asyncAfter(deadline: .now() + 1.5){
            withAnimation(
                Animation
                    .easeInOut(duration: 2.0)
                    .repeatForever()
            ){
                animated.toggle()
            }
        }
    }
}

#Preview {
    NavigationView {
        NoItemsView()
        
            .navigationTitle("Title")
    }
}
