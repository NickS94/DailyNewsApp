//
//  Article.swift
//  Daily News
//
//  Created by Nikos Stauropoulos on 09.08.24.
//

import Foundation


struct Article :Codable{
    let author :String?
    let title:String?
    let description:String?
    let urlToImage:String?
    let publishedAt:String?
    let content:String?
}
