//
//  NetworkManager1.swift
//  TimesApp
//
//  Created by Arvind on 13/07/22.
//

import Foundation

import UIKit
import Alamofire
import PromiseKit

let reachabilityManager = Alamofire.NetworkReachabilityManager(host: "www.google.com")

protocol NetworkManagerProtocol {
    @discardableResult
    func apiModelRequest<T: Decodable>(_ model: T.Type,
                                       _ url: String,
                                       _ httpMethod: HTTPMethod,
                                       _ header: [String: String]?,
                                       _ parameter: [String: AnyObject]?,
                                       success: @escaping (T) -> Void,
                                       failure: @escaping (Error) -> Void) -> SessionManager?
}

struct NetworkManager: NetworkManagerProtocol {
    
    @discardableResult
    func apiModelRequest<T: Decodable>(_ model: T.Type,
                                       _ url: String,
                                       _ httpMethod: HTTPMethod = .get,
                                       _ header: [String: String]? = nil,
                                       _ parameter: [String: AnyObject]? = nil,
                                       success: @escaping (T) -> Void,
                                       failure: @escaping (Error) -> Void) -> SessionManager? {
        
        if !(reachabilityManager!.isReachable) {
            print("reachabilityManager is not Connected")
            failure(parseError("No Internet Connection"))
            return nil
        }
        
        let request = Alamofire.SessionManager.default
        
        firstly {
            request
                .request(url, method: httpMethod, parameters: parameter, encoding: JSONEncoding.default, headers: header)
                .response(.promise)
            
        }.done { url, response, data in
            print("Url: \(url)")
            if 200..<300 ~= (response.statusCode) {
                do {
                    let responseModel = try JSONDecoder().decode(model, from: data)
                    success(responseModel)
                    
                } catch let jsonError {
                    failure(jsonError)
                }
            }
        }.catch { error in
            print("Error: \(error)")
            failure(error)
        }
        
        return request
    }
    
    fileprivate func parseError(_ error: String) -> Error {
        let error = NSError(domain: APIError.domain, code: APIError.code, userInfo: [NSLocalizedDescriptionKey: error])
        print("handleParseError: \(error.localizedDescription)")
        
        return error
    }
}

struct APIError {
    static let domain = "ParseError"
    static let message = "Unable to parse data"
    static let code = Int(UInt8.max)
}

struct APIHeader {
    static let contentType = "Content-Type"
    static let Authorization = "Authorization"
    static let applicationFormURLEncoded = "application/x-www-form-urlencoded"
    static let applicationJson = "application/json"
    static let multipartFormData = "multipart/form-data"
}
