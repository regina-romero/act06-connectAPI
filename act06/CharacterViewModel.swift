//
//  CharacterViewModel.swift
//  act06
//
//  Created by Regina Romero on 8/26/25.
//

// CharacterViewModel.swift - Fetches API and stores characters

import Foundation

@MainActor
class CharacterViewModel: ObservableObject {
    @Published var characters = [Character]()

    func loadCharacters() async {
        // Fetch data from Star Wars API
        guard let url = URL(string: "https://akabab.github.io/starwars-api/api/all.json") else {
            print("Invalid Star Wars character URL.")
            return
        }

        do {
            let (data, response) = try await URLSession.shared.data(from: url)
            guard (response as? HTTPURLResponse)?.statusCode == 200 else {
                print("Server error")
                return
            }
            // Decode JSON into Character array and update property
            let results = try JSONDecoder().decode([Character].self, from: data)
            self.characters = results  
        } catch {
            print("Decoding error: \(error)")
        }
    }
}

