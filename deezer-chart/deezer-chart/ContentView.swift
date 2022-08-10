//
//  ContentView.swift
//  deezer-chart
//
//  Created by Bogdan Petrovskiy on 10.08.22.
//

import SwiftUI
import AVFoundation
import Combine

struct Table: View {
    @ObservedObject var deezerAPI = DeezerAPI()
    
    var body: some View {
        List {
            ForEach(deezerAPI.tracks, id: \.id) { track in
                HStack() {
                    VStack() {
                        if track.position == 1 {
                            Image(systemName: "crown.fill")
                                .foregroundColor(.yellow)
                        }
                        Text("\(track.position)")
                    }
                        .frame(width: 20, height: 10)
                    AsyncImage(url: URL(string: track.album.cover)) { image in
                        image
                            .resizable()
                            .aspectRatio(contentMode: .fill)
                    } placeholder: {
                        Color.white
                    }
                        .frame(width: 50, height: 50)
                        .padding(.top, 5)
                        .padding(.bottom, 5)
                        .padding(.horizontal)
                    VStack() {
                        HStack() {
                            Text(track.title)
                                .bold()
                                .font(.title3)
                            if track.explicit_lyrics {
                                Image(systemName: "e.square.fill")
                                    .resizable()
                                    .frame(width: 15, height: 15)
                                    .foregroundColor(.red)
                            }
                            Spacer()
                        }
                        HStack() {
                            Text("\(track.artist.name) | \(track.album.title)")
                                .font(.caption)
                            Spacer()
                        }
                    }
                    Spacer()
                    Text("\(track.duration >= 3600 ? track.duration.hh_mm_ss : track.duration.mm_ss)")
                }
            }
        }
    }
}

struct ContentView: View {
    var body: some View {
        NavigationView {
            Table()
                .navigationTitle("Deezer Top Chart")
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
