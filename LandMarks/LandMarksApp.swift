//
//  LandMarksApp.swift
//  LandMarks
//
//  Created by 大林拓実 on 2021/01/08.
//

import SwiftUI

@main
struct LandMarksApp: App {
    @StateObject private var modelData = ModelData()
    
    var body: some Scene {
        WindowGroup {
            ContentView()
                .environmentObject(modelData)
        }
    }
}
