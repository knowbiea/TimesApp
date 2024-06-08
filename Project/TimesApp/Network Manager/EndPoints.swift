//
//  EndPoints.swift
//  TimesApp
//
//  Created by Arvind on 08/07/22.
//

import Alamofire

enum Endpoints {
    static let base = "https://api.nytimes.com/"
    static let apiKey = "ZOyC8fSalGYf7yrPUGKRAKej1UVTtxfI"
    
    case news
    
    var url: String {
        switch self {
        case .news: return Endpoints.base + "svc/mostpopular/v2/mostviewed/all-sections/7.json?api-key=" + Endpoints.apiKey
        
        }
    }
}
