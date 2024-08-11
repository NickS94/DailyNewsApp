//
//  ArticlesViewModel.swift
//  Daily News
//
//  Created by Nikos Stauropoulos on 09.08.24.
//

import Foundation

@MainActor
class ArticlesViewModel:ObservableObject{
    
    // MARK: -> Properties
    
    private let client = ApiClient.sharedInstance
    
    @Published var articlesList:[Article] = []
    @Published var userInput = ""
    @Published var userInputCountry:Countries = .usa
    
    // MARK: -> Methods
    
    // This function fetches the Articles by the search query.
    func fetchArticlesByQuery(){
        Task{
            do{
                let results:NewsArticlesResponse? = try await client.loadData(
                    scheme: Schemas.https.rawValue,
                    host: Host.newsApiHost.rawValue,
                    path: Paths.newsApiPathEverything.rawValue,
                    query: Queries.querySearch.rawValue,
                    header: Headers.newsApiHeader.rawValue,
                    method: Methods.get.rawValue,
                    userInput: userInput,
                    apiKey: ApiKeys.apiKey)
                
                if let results = results{
                    articlesList = results.articles.filter{$0.author != nil}
                }
                
            }catch{
                print(error)
            }
        }
    }
    
    // This function fetches the top headlines by country
    func fetchTopArticlesByCountry(){
        Task{
            do{
                let results:NewsArticlesResponse? = try await client.loadData(
                    scheme: Schemas.https.rawValue,
                    host: Host.newsApiHost.rawValue,
                    path: Paths.newsApiPathTopHeadlines.rawValue,
                    query: Queries.queryCountry.rawValue,
                    header: Headers.newsApiHeader.rawValue,
                    method: Methods.get.rawValue,
                    userInput: userInputCountry.rawValue,
                    apiKey: ApiKeys.apiKey
                )
                
               if let results = results {
                   articlesList = results.articles.filter{$0.author != nil}
                }
                
            }catch{
                print(error)
            }
        }
    }
    
}
