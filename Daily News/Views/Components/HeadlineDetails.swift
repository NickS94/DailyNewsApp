//
//  HeadlineDetails.swift
//  Daily News
//
//  Created by Nikos Stauropoulos on 09.08.24.
//

import SwiftUI

struct HeadlineDetails: View {
    
    let article:Article
    
    var body: some View {
        VStack{
            Text(article.title ?? "")
                .font(.title).bold()
                .fontDesign(.serif)
            VStack(alignment:.leading){
                Text("By \(article.author ?? "")")
                    .font(.system(size: 14).italic())
                Text("\(DateFormatterHelper.formattedDate(from: article.publishedAt))")
                    .font(.system(size: 14))
            }
            .padding(5)
            .frame(maxWidth: .infinity,alignment: .leading)

        }
        .padding()
    }
}


#Preview {
    HeadlineDetails(article:  Article(author: "Somebody", title: "Todays Crash", description: "The financial markets going deep", urlToImage: "https://ichef.bbci.co.uk/news/1024/branded_news/69fd/live/00a1f220-474a-11ef-9e1c-3b4a473456a6.png", publishedAt: Date.now.formatted(date: .numeric, time: .shortened), content: "Like every morning, there was tension. \r\nIt crackled in the air like static. So much was happening lately that only a fool would walk into the hills and not be on their guard. \r\nThe sun was already h"))
}
