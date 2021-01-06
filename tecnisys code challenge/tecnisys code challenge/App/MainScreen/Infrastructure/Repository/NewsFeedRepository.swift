//
//  NewsFeedRepository.swift
//  tecnisys code challenge
//
//  Created by Gonzalo Ivan Fuentes on 05/01/2021.
//

import Foundation
import RxSwift

class NewsFeedRepository: NewsFeedRepositoryProtocol {
    private let networkService: NetworkServiceProtocol
    private let url = "https://www.telegraph.co.uk/football/rss.xml"

    init(networkService: NetworkServiceProtocol = NetworkService()) {
        self.networkService = networkService
    }

    func getNews() -> Observable<[NewModel]> {
        return networkService.execute(url)
    }
}
