//
//  NewsFeedService.swift
//  tecnisys code challenge
//
//  Created by Gonzalo Ivan Fuentes on 05/01/2021.
//

import Foundation
import RxSwift

class NewsFeedService: NewsFeedServiceProtocol {
    private let repository: NewsFeedRepositoryProtocol

    init(repository: NewsFeedRepositoryProtocol) {
        self.repository = repository
    }

    func execute() -> Observable<[NewModel]> {
        return repository.getNews()
    }
}
