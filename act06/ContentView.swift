//
//  ContentView.swift
//  act06
//
//  Created by Regina Romero on 8/25/25.
//

// ContentView.swift - Main list view with background image and title

import SwiftUI

struct ContentView: View {
    @StateObject var viewModel = CharacterViewModel()

    var body: some View {
        
        NavigationStack {
            ZStack {
                //Set background
                Image("bg")
                    .resizable()
                    .scaledToFill()
                    .edgesIgnoringSafeArea(.all)
                
                VStack{
                    //Display list of characters with image and name
                    Text("Star Wars Characters")
                            .font(.largeTitle.bold())
                            .foregroundColor(.yellow)
                            .padding(.top, 16)
                    
                    List(viewModel.characters.prefix(15)) { item in
                        NavigationLink {
                            CharacterDetailView(character: item)
                        } label: {
                            CharacterRowView(character: item)
                        }
                        //Make list see through
                        .listRowBackground(Color.white.opacity(0.7))
                        .listRowSeparatorTint(.black, edges: .all)
                        
                    }
                    .scrollContentBackground(.hidden)
                         
                    
                    .task {
                        await viewModel.loadCharacters()
                    }
                    
                    
                }
                
                
            }
        }
        }
}




#Preview {
    ContentView()
}
