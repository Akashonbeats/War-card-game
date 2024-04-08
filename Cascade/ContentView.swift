//
//  ContentView.swift
//  Cascade
//
//  Created by Akash Sampath on 05/04/24.
//

import SwiftUI
import UIKit

struct ContentView: View {
    
    @State var playerCard = "card7"
    @State var cpuCard = "card13"
    
    @State var playerScore = 0
    @State var cpuScore = 0
    
    
    var body: some View {
        ZStack{
            Image("background-plain")
                .resizable()
                .ignoresSafeArea()
            VStack {
                Image("logo")
                    .padding()
                HStack{
                    Spacer()
                    Image(playerCard)
                    Spacer()
                    Image(cpuCard)
                    Spacer()
                }.padding()
                
                Button{
                    let impact = UIImpactFeedbackGenerator(style: .heavy)
                      impact.impactOccurred()
                    deal()
                } label: {
                    Image("button")
                }
                
                    .padding()
                HStack{
                    Spacer()
                    VStack{
                        Text("Player")
                            .font(.headline)
                            .padding()
                        Text(String(playerScore))
                            .font(.system(size: 50))
                    }
                    Spacer()
                    VStack{
                        Text("CPU")
                            .font(.headline)
                            .padding()
                        Text(String(cpuScore))
                            .font(.system(size: 50))
                    }
                    Spacer()
                }
                .foregroundColor(.white)
            }
        }
    }
    
    func deal(){
        // Randomize the Player's card
        @State var playerCardValue = Int.random(in: 2...14)
        playerCard = "card" + String(playerCardValue)
        
        // Randomize the CPU card
        @State var cpuCardValue = Int.random(in: 2...14)
        cpuCard = "card" + String(cpuCardValue)
        
        // Score updation
        if playerCardValue > cpuCardValue{
            // update player's score
            playerScore += 1
        }
        else if cpuCardValue > playerCardValue{
            //update cpu's score
            cpuScore += 1
        }
    }
}

#Preview {
    ContentView()
}
