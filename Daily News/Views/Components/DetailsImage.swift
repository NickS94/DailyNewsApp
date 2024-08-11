//
//  DetailsImage.swift
//  Daily News
//
//  Created by Nikos Stauropoulos on 09.08.24.
//

import SwiftUI

struct DetailsImage: View {
    let article:Article
    var body: some View {
        // A lot of the API image urls was nil so i filtered them.
        if article.urlToImage != nil{
            AsyncImage(url: URL(string: article.urlToImage ?? "")){ Image in
                Image
                    .resizable()
                    .scaledToFill()
                    .frame(maxWidth: .infinity,maxHeight: 200)
                    .clipShape(RoundedRectangle(cornerRadius: 12))
                    .padding()
                    .shadow(radius: 10)
                
            }placeholder: {
                ProgressView("Loading...")
            }
        }
    }
}

