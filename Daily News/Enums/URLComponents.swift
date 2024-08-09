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
