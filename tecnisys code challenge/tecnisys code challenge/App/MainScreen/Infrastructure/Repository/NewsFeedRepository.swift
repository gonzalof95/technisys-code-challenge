//
//  NewsFeedRepository.swift
//  tecnisys code challenge
//
//  Created by Gonzalo Ivan Fuentes on 05/01/2021.
//

import Foundation
import RxSwift
import AlamofireRSSParser

class NewsFeedRepository: NewsFeedRepositoryProtocol {
    private let networkService: NetworkService
    private let url = "https://www.telegraph.co.uk/football/rss.xml"

    init(networkService: NetworkService = NetworkService()) {
        self.networkService = networkService
    }

    func getNews() -> Observable<RSSFeed> {
        return networkService.execute(url)
    }
}
