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
                    VStack{
                        Image(systemName: "house")
                        Text("Home")
                    }
                }
            
            NewsView()
                .tabItem {
                    VStack{
                        Image(systemName: "newspaper")
                        Text("News")
                    }
                }
        }
    }
}

#Preview {
    ContentView()
}
