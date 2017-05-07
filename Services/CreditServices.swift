//
//  CreditServices.swift
//  iMovie
//
//  Created by XuanChien on 2/1/17.
//  Copyright © 2017 XuanChien. All rights reserved.
//

import Foundation
import Alamofire
import SwiftyJSON

typealias PersonCompletionHandler = (Result<Person>) -> Void

class CreditServices {
    
    func detail(personId id: Int,
                language: String = String.empty,
                appendToResponse: String = String.empty,
                completion: @escaping PersonCompletionHandler) {
        let params: [String: Any] = [
            Strings.APIKey: Keys.APIKey,
            Strings.AppendToResponse: appendToResponse,
            Strings.Language: language
        ]
        let url = "\(APIs.Person)/\(id)"
        Alamofire.request(url,
                          method: .get,
                          parameters: params,
                          encoding: URLEncoding.default,
                          headers: nil)
            .responseJSON { response in
                switch response.result {
                case .success(let value):
                    let json = JSON(value)
                    let result = Person(json: json)
                    completion(Result.success(result))
                case .failure(let error):
                    completion(Result.failure(error))
                }
        }
    }
    
}
