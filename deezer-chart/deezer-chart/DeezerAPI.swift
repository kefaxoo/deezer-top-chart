//
//  DeezerAPI.swift
//  deezer-chart
//
//  Created by Bogdan Petrovskiy on 10.08.22.
//

import Foundation
import Alamofire

class DeezerAPI: ObservableObject {
    private let urlChart = "https://api.deezer.com/chart/0/tracks"
    @Published private(set) var tracks: [Track] = []
    
    init() {
        getTracks()
    }
    
    func getTracks() {
        Alamofire.request(urlChart).responseData { (dataResponse) in
            if let error = dataResponse.error {
                print("Error: \(error.localizedDescription)")
                return
            }
            
            guard let data = dataResponse.data else { return }
            let decoder = JSONDecoder()
            do {
                let tracks = try decoder.decode(ResponseStructure.self, from: data)
                self.tracks = tracks.data
            } catch let jsonError {
                print("Fail: \(jsonError)")
            }
        }
    }
}
