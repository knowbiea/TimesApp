//
//  MockNetworkManager.swift
//  TimesAppTests
//
//  Created by Arvind on 13/07/22.
//

import UIKit
import Alamofire
import PromiseKit
@testable import TimesApp

struct MockNetworkManager: NetworkManagerProtocol {
    
    @discardableResult
    func apiModelRequest<T: Decodable>(_ model: T.Type,
                                       _ url: String,
                                       _ httpMethod: HTTPMethod = .get,
                                       _ header: [String : String]? = nil,
                                       _ parameter: [String : AnyObject]? = nil,
                                       success: @escaping (T) -> Void,
                                       failure: @escaping (Error) -> Void) -> SessionManager? {
        
        let sessionManager = Alamofire.SessionManager.default
        sessionManager.request(url, method: httpMethod, parameters: parameter, encoding: JSONEncoding.default, headers: header).response {
            response in
        
            if response.error != nil {
                failure(response.error!)
                
            } else {
                guard let data = response.data else {
                    failure(self.parseError(APIError.message))
                    return
                }
                
                do {
                    let responseModel = try JSONDecoder().decode(model, from: data)
                    success(responseModel)
                    
                } catch let jsonError {
                    failure(jsonError)
                }
            }
            
        }
        
        return sessionManager
    }
    
    fileprivate func parseError(_ error: String) -> Error {
         let error = NSError(domain:APIError.domain, code:APIError.code, userInfo:[ NSLocalizedDescriptionKey: error])
         print("handleParseError: \(error.localizedDescription)")
         
         return error
     }
}
