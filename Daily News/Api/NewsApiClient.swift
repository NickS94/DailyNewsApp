//
//  NewsApiClient.swift
//  Daily News
//
//  Created by Nikos Stauropoulos on 09.08.24.
//

import Foundation

class NewsApiClient{
    
    static let sharedInstance = NewsApiClient()
    
    func loadData <T:Codable> (userInput:String? = nil ,apiKey:String? = nil )  async throws  -> T? {
        
        var urlComponents = URLComponents()
        urlComponents.scheme = "https"
        urlComponents.host = "newsapi.org"
        urlComponents.path = "/v2/everything"
        
        let queryItems = [ URLQueryItem(name: "q", value: userInput),URLQueryItem(name: "apiKey", value: apiKey)]
        
        urlComponents.queryItems?.append(contentsOf: queryItems)
 
        guard let  url = urlComponents.url else{
            throw ApiErrors.invalidUrl
        }
        
        let (data,response) =  try await URLSession.shared.data(from: url)
        
        guard let  statusCode = (response as? HTTPURLResponse)?.statusCode else{
            throw ApiErrors.unknownError
        }
        
        switch statusCode{
        case 200:
            do{
                return try JSONDecoder().decode(T.self, from: data)
            }catch{
                print(error)
                throw ApiErrors.decodingError
            }
        case 400:
            throw ApiErrors.badResponse
        case 401:
            throw ApiErrors.authenticationMissing
        case 404:
            throw ApiErrors.notFound
        case 429:
            throw ApiErrors.tooManyRequests
        default:
            throw ApiErrors.unknownError
        }
    }
}
