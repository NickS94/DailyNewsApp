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
            if article.urlToImage != nil{
                AsyncImage(url: URL(string: article.urlToImage ?? "")){ image in
                    image
                        .resizable()
                        .frame(width: 120,height: 100)
                        .scaledToFill()
                        .clipShape(RoundedRectangle(cornerRadius: 10))
                }placeholder: {
                    ProgressView("Loading...")
                }
            }
            VStack(alignment:.leading,spacing: 10) {
                Text("Autor: \(article.author ?? "")")
                    .font(.system(size: 14).bold())
                    .fontDesign(.serif)
                
                Text("\((article.title ?? "").prefix(20))")
                    .font(.system(size: 16,weight: .semibold, design: .serif))
                
                Text("\(article.description ?? "")")
                    .font(.system(size: 14))
                    .lineLimit(2)
            }
        }
        .padding(15)

    }
}

#Preview {
    ArticleRow(article: Article(author: "Feras", title: "Ich Bin Developer", description: "SOmETHIngBla BLA", urlToImage: "https://i.insider.com/66a411cf1a227600e6322481?width=1200&format=jpeg",publishedAt: Date.now.formatted(date: .abbreviated, time: .standard), content: "blalabalab"))
}
