//
//  filteredViewModel.swift
//  Daily News
//
//  Created by Nikos Stauropoulos on 10.08.24.
//

import Foundation

@MainActor
class FilteredArticlesViewModel:ObservableObject{
    private let client = NewsApiClient.sharedInstance
    
    @Published var filteredArticlesList:[Article] = [ ]
    @Published var userInputKeyword = ""
    @Published var userInputDateFrom  = Date.now
    @Published var userInputDateTo = Date.now
    
    
    func fetchFilteredArticles(){
        Task{
            do{
                let results:NewsArticlesResponse? = try await client.loadData(
                    scheme: Schemas.https.rawValue,
                    host: Host.newsApiHost.rawValue,
                    path: Paths.newsApiPathEverything.rawValue,
                    query: Queries.querySearch.rawValue,
                    header: Headers.newsApiHeader.rawValue,
                    method: Methods.get.rawValue,
                    userInput: userInputKeyword,
                    userSecondInput: String(userInputDateFrom.formatted(.iso8601)),
                    userThirdInput: String(userInputDateTo.formatted(.iso8601)),
                    apiKey: ApiKeys.apiKey)
                
                if let results = results {
                    filteredArticlesList = results.articles.filter{$0.author != nil}
                }
            }catch{
                print(error)
            }
        }
    }
    
}
