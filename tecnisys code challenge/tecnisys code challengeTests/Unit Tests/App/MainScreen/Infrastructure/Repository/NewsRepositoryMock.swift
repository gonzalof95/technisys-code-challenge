//
//  NewsRepositoryMock.swift
//  tecnisys code challengeTests
//
//  Created by Gonzalo Ivan Fuentes on 06/01/2021.
//

import RxSwift
@testable import tecnisys_code_challenge

class NewsRepositoryProtocolMock: NewsFeedRepositoryProtocol {
    var invokedGetNews = false
    var invokedGetNewsCount = 0
    var stubbedGetNewsResult: Observable<[NewModel]>!

    func getNews() -> Observable<[NewModel]> {
        invokedGetNews = true
        invokedGetNewsCount += 1

        let mockService = NetworkServiceMock()
        stubbedGetNewsResult = mockService.execute("url")

        return stubbedGetNewsResult
    }
}
