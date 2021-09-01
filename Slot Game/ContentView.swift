//
//  ContentView.swift
//  Slot Game
//
//  Created by Han on 22/8/21.
//

import SwiftUI

struct ContentView: View {
    @State var cred = 1000
    @State var slot1 = "apple"
    @State var slot2 = "star"
    @State var slot3 = "cherry"
    @State var gameover = false
    var body: some View {
        VStack{
            Text("Fruits Slot")
                .padding().font(/*@START_MENU_TOKEN@*/.title/*@END_MENU_TOKEN@*/)
            Spacer()
            
            Text(String(cred)).font(.title2)
            Spacer()
            HStack{
                Spacer()
                //Slot1
                Image(slot1)
                    .resizable()
                    .aspectRatio(contentMode: .fit)
                    
                Spacer()
                //Slot2
                Image(slot2)
                    .resizable()
                    .aspectRatio(contentMode: .fit)
                
                    
                Spacer()
                //Slot3
                Image(slot3)
                    .resizable()
                    .aspectRatio(contentMode: .fit)
                    
                    
                Spacer()
            }
            Spacer()
            
            Button(action: {
                //generate random fruit
                let fruitArray = ["apple","star","cherry"]
                let slot1Ran = fruitArray.randomElement()!
                slot1 = String(slot1Ran)
                
                let slot2Ran = fruitArray.randomElement()!
                slot2 = String(slot2Ran)
                
                let slot3Ran = fruitArray.randomElement()!
                slot3 = String(slot3Ran)
                
                if slot1Ran == slot2Ran && slot2Ran == slot3Ran {
                    cred += 50
                }else {
                    cred -= 5
                }
                
                if cred == 0 {
                   
                    cred = 1000
                }
            
            }, label: {
                
                if cred == 0 {
                    Text("Try Again").font(.subheadline).fontWeight(.bold).padding().foregroundColor(.red)
                   
                }else{
                    Text("Spin").font(.subheadline).fontWeight(.bold).padding().foregroundColor(.white)
                }
                
                
            }).padding([.leading, .trailing], 40)
            .border(Color.white).background(Color.green)
            .foregroundColor(Color.white)
            .cornerRadius(50)

            
            Spacer()
        }
        
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
