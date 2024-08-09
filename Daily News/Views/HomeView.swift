//
//  HomeView.swift
//  Daily News
//
//  Created by Nikos Stauropoulos on 09.08.24.
//

import SwiftUI

struct HomeView: View {
    
    @StateObject var viewModel = ArticlesViewModel()
    
    var body: some View {
        NavigationStack{
            List {
                ForEach(viewModel.articlesList , id: \.description) { article in
                    NavigationLink {
                        Text("Details")
                    } label: {
                        ArticleRow(article: article)
                    }
                }
            }
            .listStyle(.inset)
            .navigationTitle("Home")
        }
        .searchable(text: $viewModel.userInput)
        .onChange(of: viewModel.userInput, {
            viewModel.fetchArticles()
        })
        .onAppear{
            viewModel.fetchArticles()
        }
    }
}

