//
//  CharacterDetailView.swift
//  act06
//
//  Created by Regina Romero on 8/26/25.
//

//  CharacterDetailView.swift - Shows detailed info for a single Star Wars character.

import SwiftUI

struct CharacterDetailView: View {
    let character: Character

    var body: some View {
        ScrollView {
            VStack {
                //Displays character image
                AsyncImage(url: URL(string: character.image)) { image in
                    image
                        .resizable()
                        .scaledToFit()
                        .frame(maxWidth: 150)
                        .clipShape(RoundedRectangle(cornerRadius: 12))
                        .shadow(radius: 5)
                } placeholder: {
                    ProgressView()
                        .frame(height: 200)
                }

                //Displays character name
                Text(character.name)
                    .font(.largeTitle)
                    .fontWeight(.bold)
                    .multilineTextAlignment(.center)
                    .padding(.top)

                //Displays details about character, including height, species, affiliations, and wiki page
                VStack(alignment: .leading, spacing: 8) {
                    if let height = character.height {
                        Text("**Height:** \(String(format: "%.2f", height)) m")
                    }

                    Text("**Species:** \(character.species)")

                    Text("**Affiliations:**")
                        .font(.headline)
                        .padding(.top, 4)
                    ForEach(character.affiliations.prefix(5), id: \.self) { affiliation in
                        Text("• \(affiliation)")
                    }
                    
                    Spacer()

                    
                    Link("🌐 Wiki Page", destination: URL(string: character.wiki)!)
                        .foregroundColor(.blue)
                        .padding(.top, 8)
                }

                .padding()
            }
            .padding()
        }
        .navigationTitle(character.name)
        
    }
}

#Preview {
    CharacterDetailView(
        character: Character(
            id: 1,
            name: "Luke Skywalker",
            height: 1.72,
            wiki: "http://starwars.wikia.com/wiki/Luke_Skywalker",
            image: "https://vignette.wikia.nocookie.net/starwars/images/2/20/LukeTLJ.jpg",
            species: "Human",
            affiliations: [
                "Alliance to Restore the Republic",
                "Jedi Order",
                "Resistance"
            ]
        )
    )
}
