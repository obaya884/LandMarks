//
//  ContentView.swift
//  LandMarks
//
//  Created by 大林拓実 on 2021/01/08.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        LandmarkList()
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
            .environmentObject(ModelData())
    }
}
