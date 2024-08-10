//
//  NewsApiClient.swift
//  Daily News
//
//  Created by Nikos Stauropoulos on 09.08.24.
//

import Foundation

class NewsApiClient{
    
    static let sharedInstance = NewsApiClient()
    
    func loadData <T:Codable> (
        scheme:String,
        host:String,
        path:String,
        query:String,
        header:String? = nil  ,
        method:String? = nil ,
        userInput:String? = nil ,
        userSecondInput:String? = nil,
        userThirdInput:String? = nil,
        apiKey:String? = nil )  async throws  -> T? {
            
            var urlComponents = URLComponents()
            urlComponents.scheme = scheme
            urlComponents.host = host
            urlComponents.path = path
            
            urlComponents.queryItems = [
                   URLQueryItem(name: query, value: userInput),
                   URLQueryItem(name:Queries.dateFrom.rawValue,value: userSecondInput),
                   URLQueryItem(name:Queries.dateTo.rawValue,value: userThirdInput),        
               ]
            
            guard let  url = urlComponents.url else{
                throw ApiErrors.invalidUrl
            }
            
            var headers :[String : String] = [:]
            
            if let header = header, let apiKey = apiKey {
                headers = [
                    header : apiKey
                ]
            }

            var request = URLRequest(url: url)
            request.httpMethod  = method ?? "GET"
            request.allHTTPHeaderFields = headers
 
            
            let (data,response) =  try await URLSession.shared.data(for: request)
            
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
