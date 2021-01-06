//
//  NewsServiceTest.swift
//  tecnisys code challengeTests
//
//  Created by Gonzalo Ivan Fuentes on 06/01/2021.
//

import Foundation
import XCTest
import RxSwift
@testable import tecnisys_code_challenge

class NewsServiceTest: XCTestCase {
    var repository: NewsRepositoryProtocolMock!
    var mock: NewsServiceProtocolMock!
    var disposeBag: DisposeBag!
    var newsData: [NewModel] = []

    override func setUp() {
        super.setUp()
        repository = NewsRepositoryProtocolMock()
        disposeBag = DisposeBag()
        mock = nil
    }

    func testGetNewsSuccess() {
        whenGetNews()
        assertGetNews()
    }

    func testExecuteInvoked() {
        givenMock()
        let response = mock.execute()
        assertTestGetNews(response: response)
    }
}

private extension NewsServiceTest {
    func givenMock() {
        mock = NewsServiceProtocolMock()
    }

    func whenGetNews() {
        repository.getNews().subscribe(onNext: { [weak self] response in
            self?.newsData = response
        })
        .disposed(by: disposeBag)
    }

    func assertGetNews() {
        XCTAssertNotNil(newsData)
        XCTAssertEqual(newsData[0].title, "title")
        XCTAssertEqual(newsData[0].description, "description")
        XCTAssertEqual(newsData[0].imageUrl, "image")
    }

    func assertTestGetNews(response: Observable<[NewModel]>) {
        XCTAssertTrue(mock.invokedExecute)
        XCTAssertEqual(mock.invokedExecuteCount, 1)
        XCTAssertNotNil(response)
    }
}
