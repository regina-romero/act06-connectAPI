//
//  Character.swift
//  act06
//
//  Created by Regina Romero on 8/26/25.
//

// Character.swift - Model for Star Wars character

import Foundation


struct Character: Identifiable, Decodable {
    let id: Int
    let name: String
    let height: Double?
    let wiki: String
    let image: String
    let species: String
    let affiliations: [String]
   

}




