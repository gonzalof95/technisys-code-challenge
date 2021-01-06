//
//  NewsFileProtocolMock.swift
//  tecnisys code challengeTests
//
//  Created by Gonzalo Ivan Fuentes on 06/01/2021.
//

import RxSwift
@testable import tecnisys_code_challenge

final class NewsServiceProtocolMock: NewsFeedServiceProtocol {
    var invokedExecute = false
    var invokedExecuteCount = 0
    var stubbedExecuteResult: Observable<[NewModel]>!

    func execute() -> Observable<[NewModel]> {
        invokedExecute = true
        invokedExecuteCount += 1

        let mock = NewsRepositoryProtocolMock()
        stubbedExecuteResult = mock.getNews()

        return stubbedExecuteResult
    }
}
