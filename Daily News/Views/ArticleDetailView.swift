//
//  ArticleDetailView.swift
//  Daily News
//
//  Created by Nikos Stauropoulos on 09.08.24.
//

import SwiftUI

struct ArticleDetailView: View {
    let article:Article
    let navigationTitle:String
    var body: some View {
        ScrollView {
            HeadlineDetails(article: article)
            ArticleDetailsDescription(article: article)
            DetailsImage(article: article)
                Text(article.content ?? "")
                    .font(.title3.italic())
                    .padding()
            }
        .navigationTitle(navigationTitle)
    }
}

#Preview {
    ArticleDetailView(article: Article(author: "Somebody", title: "Todays Crash", description: "The financial markets going deep", urlToImage: "https://ichef.bbci.co.uk/news/1024/branded_news/69fd/live/00a1f220-474a-11ef-9e1c-3b4a473456a6.png", publishedAt: Date.now.formatted(date: .numeric, time: .shortened), content: "Like every morning, there was tension. \r\nIt crackled in the air like static. So much was happening lately that only a fool would walk into the hills and not be on their guard. \r\nThe sun was already h"), navigationTitle: "some title")
}
