//
//  CharacterRowView.swift
//  act06
//
//  Created by Regina Romero on 8/26/25.
//

// CharacterRowView.swift - Shows a single character in a list row

import SwiftUI

struct CharacterRowView: View {
    let character: Character

    var body: some View {
        HStack(spacing: 12) {
            //Displays image
            AsyncImage(url: URL(string: character.image)){ image in
                image
                    .resizable()
                    .scaledToFit()
            } placeholder: {
                Rectangle()
                    .fill(Color.gray.opacity(0.3))
                    .overlay(
                        ProgressView()
                    )
            }
            .frame(width: 150, height: 150)

            VStack(alignment: .leading) {
                //Displays character name
                Text(character.name)
                    .font(.headline)
                
                
                
            }
        }
        .padding(.vertical, 6)
    }
}

#Preview {
    CharacterRowView(
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

