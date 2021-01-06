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
    var newsFeed: [NewModel] = []

    func execute(_ url: String) -> Observable<[NewModel]> {
        return Observable.create { observer -> Disposable in

            AF.request(url).responseRSS { response in
                switch response.result {
                case .success:
                    if let feed: RSSFeed = response.value {
                        self.mapResponseToFeed(feed: feed)
                        observer.onNext(self.newsFeed)
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

    private func mapResponseToFeed(feed: RSSFeed) {
        for item in feed.items {
            guard let imageData = item.enclosures else { return }
            var imageUrl = ""
            for item in imageData {
                let pair = item.first{ $0.key == "url" }
                imageUrl = pair?.value ?? ""
            }

            let new = NewModel(title: item.title,
                               description: item.itemDescription,
                               date: item.pubDate,
                               imageUrl: imageUrl)
            newsFeed.append(new)
        }
    }

    enum networkError: Int, Error {
        case unAuthorized = 401
        case notFound = 404
    }
}
