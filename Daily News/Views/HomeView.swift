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
           // Picker for country selection .
                Picker("Select Country", selection: $viewModel.userInputCountry) {
                        ForEach(Countries.allCases , id: \.fullName){coutry in
                        Text(coutry.fullName).tag(coutry)
                        }
                }
                .pickerStyle(.navigationLink)
                .padding()
            // List for the articles.
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
            .navigationTitle("Todays Hot \(viewModel.userInputCountry.fullName)")
        }
        // Search bar on top.
        .searchable(text: $viewModel.userInput,prompt: "Search by keyword")
        // When you begin typing in the search bar it sends automaticly the results based on the keywords you are typing in.
        .onChange(of: viewModel.userInput) {
            viewModel.fetchArticlesByQuery()
        }
        // When you pick a country it changes the list of results for the spacific country you choose for.
        .onChange(of: viewModel.userInputCountry) {
            viewModel.fetchTopArticlesByCountry()
        }
        // On appear of the view it loads the Top headlines for the country U.S.A today (the latest are the API default results).
        .onAppear{
            viewModel.fetchTopArticlesByCountry()
        }
    }
}

//#Preview {
//    HomeView(viewModel: ArticlesViewModel())
//}
