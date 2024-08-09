//
//  ContentView.swift
//  Daily News
//
//  Created by Fabian Moreno on 28.06.23.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        TabView{
            HomeView()
                .tabItem {
                    Image(systemName: "newspaper")
                }
        }
    }
}

#Preview {
    ContentView()
}
