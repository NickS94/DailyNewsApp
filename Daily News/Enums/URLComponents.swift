//
//  URLComponents.swift
//  Daily News
//
//  Created by Nikos Stauropoulos on 09.08.24.
//

import Foundation

enum Schemas:String{
    case https = "https"
}

enum Host:String{
    case newsApiHost = "newsapi.org"
}

enum Paths:String{
    case newsApiPathEverything = "/v2/everything"
    case newsApiPathTopHeadlines = "/v2/top-headlines"

}

enum Queries:String{
    case querySearch = "q"
    case queryCountry = "country"
    case dateFrom = "from"
    case dateTo = "to"
}


enum  Countries:String,CaseIterable{
    case germany  = "de"
    case usa = "us"
    case england = "gb"
    case canada = "ca"
    case japan = "jp"
    case russia = "ru"
    case greece = "gr"
    
    var fullName:String{
        switch self{
      
        case .germany:
            "Germany"
        case .usa:
            "United States"
        case .england:
            "United Kingdom"
        case .canada:
            "Canada"
        case .greece:
            "Greece"
        case .japan:
            "Japan"
        case .russia:
            "Russia"
        }
    }
}



enum Categories:String,CaseIterable{
    case financeNews = "finance"
}




enum Methods:String{
    case get = "GET"
    case post = "POST"
    case put = "PUT"
    case delete = "DELETE"
}

enum Headers:String{
    case newsApiHeader = "X-Api-Key"
}
