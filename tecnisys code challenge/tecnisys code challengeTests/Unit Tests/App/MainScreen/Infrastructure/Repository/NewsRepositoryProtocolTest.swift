//
//  NewsRepositoryProtocolTest.swift
//  tecnisys code challengeTests
//
//  Created by Gonzalo Ivan Fuentes on 06/01/2021.
//

import XCTest
import RxSwift
@testable import tecnisys_code_challenge

final class NewsRepositoryProtocoltest: XCTestCase {
    var mock: NewsRepositoryProtocolMock!

    override func tearDown() {
        super.tearDown()
        mock = nil
    }

    func assertGetNewsInvoked() {
        givenMock()
        let response = mock.getNews()
        assertGetNewsInvoked(response)
    }
}

private extension NewsRepositoryProtocoltest {
    func givenMock() {
        mock = NewsRepositoryProtocolMock()
    }

    func assertGetNewsInvoked(_ response: Observable<[NewModel]>) {
        XCTAssertTrue(mock.invokedGetNews)
        XCTAssertEqual(mock.invokedGetNewsCount, 1)
        XCTAssertNotNil(response)
    }
}
