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
           
                Picker("Select Country", selection: $viewModel.userInputCountry) {
                        ForEach(Countries.allCases , id: \.fullName){coutry in
                        Text(coutry.fullName).tag(coutry)
                        }
                }
                .pickerStyle(.navigationLink)
                .padding()
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
        .searchable(text: $viewModel.userInput,prompt: "Search by keyword")
        .onChange(of: viewModel.userInput) {
            viewModel.fetchArticlesByQuery()
        }
        .onChange(of: viewModel.userInputCountry) {
            viewModel.fetchTopArticlesByCountry()
        }
        .onAppear{
            viewModel.fetchTopArticlesByCountry()
        }
    }
}

#Preview {
    HomeView(viewModel: ArticlesViewModel())
}
