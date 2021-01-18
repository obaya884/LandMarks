//
//  ModelData.swift
//  LandMarks
//
//  Created by 大林拓実 on 2021/01/08.
//

import Foundation
import Combine

final class ModelData: ObservableObject {
    @Published var landmarks: [LandMark] = load("landmarkData.json")
    var hikes: [Hike] = load("hikeData.json")
    
    var features: [LandMark] {
        landmarks.filter{ $0.isFeatured }
    }
    
    var categories: [String: [LandMark]] {
        Dictionary (
            grouping: landmarks,
            by: { $0.category.rawValue }
        )
    }
}

func load<T: Decodable>(_ filename: String) -> T {
    let data: Data
    
    guard let file = Bundle.main.url(forResource: filename, withExtension: nil)
    else {
        fatalError("Couldn't find \(filename) in main bundle.")
    }
    
    do {
        data = try Data(contentsOf: file)
    } catch {
        fatalError("Couldn'y load \(filename) from main bundle:\n\(error)")
    }
    
    do {
        let decoder = JSONDecoder()
        return try decoder.decode(T.self, from: data)
    } catch {
        fatalError("Couldn't parse \(filename) as \(T.self):\n\(error)")
    }
}
