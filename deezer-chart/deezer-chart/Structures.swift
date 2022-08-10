//
//  Structures.swift
//  deezer-chart
//
//  Created by Bogdan Petrovskiy on 10.08.22.
//

import Foundation

struct ResponseStructure: Decodable {
    let data: [Track ]
    let total: Int
}

struct Track: Codable, Identifiable {
    let id: Int
    let title: String
    let link: String
    let duration: TimeInterval
    let explicit_lyrics: Bool
    let preview: String
    let position: Int
    let artist: Artist
    let album: Album
    let type: String
}

struct Artist: Codable, Identifiable {
    let id: Int
    let name: String
    let link: String
    let picture: String
    let picture_xl: String
    let tracklist: String
    let type: String
}


struct Album: Codable, Identifiable {
    let id: Int
    let title: String
    let cover: String
    let cover_xl: String
    let tracklist: String
    let type: String
}
