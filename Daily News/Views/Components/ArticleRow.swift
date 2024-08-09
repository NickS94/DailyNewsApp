//
//  ArticleRow.swift
//  Daily News
//
//  Created by Nikos Stauropoulos on 09.08.24.
//

import SwiftUI

struct ArticleRow: View {
    let article:Article
    
    var body: some View {
        HStack{
            AsyncImage(url: URL(string: article.urlToImage ?? "https://i.insider.com/66a411cf1a227600e6322481?width=1200&format=jpeg")){ image in
                image
                    .resizable()
                    .frame(width: 100,height: 100)
                    .scaledToFit()
                    .clipShape(RoundedRectangle(cornerRadius: 10))
            }placeholder: {
                ProgressView("Loading...")
            }
            VStack(alignment:.leading,spacing: 10) {
                Text("Autor: \(article.author ?? "Somebody")")
                    .font(.system(size: 14).bold())
                    .fontDesign(.serif)
                
                Text("Title: \((article.title ?? "Some Title").prefix(20))")
                    .font(.system(size: 16,design: .serif))
                
                Text("\(article.description ?? "something")")
                    .font(.system(size: 14))
                    .lineLimit(2)
            }
        }
        .padding(.trailing ,10)
        Divider()
    }
}

#Preview {
    ArticleRow(article: Article(author: "Feras", title: "Ich Bin Developer", description: "SOmETHIngBla BLA", urlToImage: "https://i.insider.com/66a411cf1a227600e6322481?width=1200&format=jpeg",publishedAt: Date.now.formatted(date: .abbreviated, time: .standard), content: "blalabalab"))
}
