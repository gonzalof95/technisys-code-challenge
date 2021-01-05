//
//  NetworkingService.swift
//  tecnisys code challenge
//
//  Created by Gonzalo Ivan Fuentes on 05/01/2021.
//

import Alamofire
import AlamofireRSSParser

enum NetworkResponseStatus {
    case succes
    case error(string: String?)
}

class NetworkService {
    func execute(path: String, completionHandler: @escaping (_ response: RSSFeed?, _ status: NetworkResponseStatus) -> Void) {
        AF.request(path).responseRSS { response in
            if let feed: RSSFeed = response.value {
                completionHandler(feed, .succes)
            } else {
                completionHandler(nil, .error(string: response.error?.localizedDescription))
            }
        }
    }
}
