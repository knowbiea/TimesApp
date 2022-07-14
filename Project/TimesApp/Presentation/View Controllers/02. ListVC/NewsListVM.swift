//
//  ListVM.swift
//  TimesApp
//
//  Created by Arvind on 08/07/22.
//

import UIKit

protocol NewsListOutput {
    var newsArray: [News]? { get set }
}

protocol NewsListInput {
    func getNewsListNews(url: String, completion: @escaping (Bool, String?) -> Void)
    func searchNews(_ newsName: String, completion: @escaping () -> Void)
}

protocol NewsListProtocol: NewsListInput, NewsListOutput {}

final class NewsListVM: NewsListProtocol {
    
    // MARK: - Properties
    var newsArray: [News]?
    var newsFilteredArray: [News]?
    var networkManager: NetworkManagerProtocol!
    
    init(networkManager: NetworkManagerProtocol) {
        self.networkManager = networkManager
    }
    
    // MARK: - Custom Methods
    func searchNews(_ newsName: String, completion: @escaping () -> Void) {
        
        if newsName.count > 0 {
            newsFilteredArray = newsArray?.filter { film -> Bool in
                return film.title?.lowercased().contains(newsName.lowercased()) ?? false
                
            }
        } else {
            newsFilteredArray = newsArray
            
        }
        
        completion()
    }
    
    // MARK: - API Calling
    func getNewsListNews(url: String, completion: @escaping (Bool, String?) -> Void) {
        networkManager.apiModelRequest(NewsList.self, url, .get, nil, nil) { response in
            self.newsArray = response.results
            self.newsFilteredArray = response.results
            completion(true, nil)
            
        } failure: { error in
            completion(false, error.localizedDescription)
            
        }
    }
}
