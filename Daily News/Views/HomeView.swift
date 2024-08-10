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
                ForEach(viewModel.articlesList, id: \.title) { article in
                    NavigationLink {
                        ArticleDetailView(article: article, navigationTitle: viewModel.userInput)
                    } label: {
                        ArticleRow(article: article)
                    }
                }
            }
            .listStyle(.inset)
            .navigationTitle("Todays Hot")
        }
        .searchable(text: $viewModel.userInput,prompt: "Search by keyword")
        .onChange(of: viewModel.userInput, {
            viewModel.fetchArticlesByQuery()
            viewModel.fetchTopArticlesByCountry()
        })
        .onAppear{
            viewModel.fetchTopArticlesByCountry()
        }
    }
}

