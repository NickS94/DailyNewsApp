//
//  ArticleDetailsDescription.swift
//  Daily News
//
//  Created by Nikos Stauropoulos on 10.08.24.
//

import SwiftUI

struct ArticleDetailsDescription: View {
    let article:Article
    var body: some View {
        Text(article.description ?? "")
            .fontWeight(.semibold)
            .fontDesign(.serif)
            .padding()
    }
}
