//
//  NetworkingService.swift
//  tecnisys code challenge
//
//  Created by Gonzalo Ivan Fuentes on 05/01/2021.
//

import Alamofire
import AlamofireRSSParser
import RxSwift

class NetworkService: NetworkServiceProtocol {
    func execute(_ url: String) -> Observable<RSSFeed> {
        return Observable.create { observer -> Disposable in

            AF.request(url).responseRSS { response in
                switch response.result {
                case .success:
                    if let feed: RSSFeed = response.value {
                        observer.onNext(feed)
                    } else  {
                        observer.onError(response.error ?? networkError.notFound)
                    }
                case .failure(let error):
                    if let statusCode = response.response?.statusCode,
                       let reason = networkError(rawValue: statusCode) {
                        observer.onError(reason)
                    }
                    observer.onError(error)
                }
            }
            return Disposables.create()
        }
    }

    enum networkError: Int, Error {
        case unAuthorized = 401
        case notFound = 404
    }
}
