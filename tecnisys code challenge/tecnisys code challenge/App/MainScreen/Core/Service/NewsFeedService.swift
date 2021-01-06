//
//  NewsFeedService.swift
//  tecnisys code challenge
//
//  Created by Gonzalo Ivan Fuentes on 05/01/2021.
//

import Foundation
import RxSwift
import AlamofireRSSParser

class NewsFeedService: NewsFeedServiceProtocol {
    private let repository: NewsFeedRepositoryProtocol

    init(repository: NewsFeedRepositoryProtocol) {
        self.repository = repository
    }

    func execute() -> Observable<RSSFeed> {
        return repository.getNews()
    }
}
