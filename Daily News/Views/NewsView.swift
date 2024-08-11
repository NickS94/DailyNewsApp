//
//  FilteringView.swift
//  Daily News
//
//  Created by Nikos Stauropoulos on 10.08.24.
//

import SwiftUI

struct NewsView: View {
    
    @StateObject var viewModel = FilteredArticlesViewModel()
    @State var isExpanded = false
    
    var body: some View {
        NavigationStack{
            VStack{
                FilterDisclosure(viewModel: viewModel, isExpanded: $isExpanded)
                Spacer()
                if viewModel.filteredArticlesList.isEmpty     {
                    Text("Use the filter for results")
                }else{
                    List {
                        ForEach(viewModel.filteredArticlesList, id: \.description){ article in
                            NavigationLink {
                                ArticleDetailView(article: article, navigationTitle: viewModel.userInputKeyword)
                            } label: {
                                ArticleRow(article: article)
                            }
                        }
                    }
                }
            }
            .navigationTitle("News")
        }
    }
}

//#Preview {
//    NewsView()
//}
