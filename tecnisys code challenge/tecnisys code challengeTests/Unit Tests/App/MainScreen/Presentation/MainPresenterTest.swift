//
//  MainPresenterTest.swift
//  tecnisys code challengeTests
//
//  Created by Gonzalo Ivan Fuentes on 06/01/2021.
//

import XCTest
@testable import tecnisys_code_challenge

final class MainPresenterTest: XCTestCase {
    var presenter: MainPresenter!
    var delegate: MainViewControllerMock!
    var service: NewsServiceProtocolMock!

    override func tearDown() {
        super.tearDown()
        service = nil
        presenter = nil
        delegate = nil
    }

    func testViewLoaded() {
        givenMocks()
        whenPresenterLoaded()
        assertTestViewLoaded()
    }

    func testRowTaped() {
        givenMocks()
        whenRowTapped()
    }
}

private extension MainPresenterTest {
    func givenMocks() {
        service = NewsServiceProtocolMock()
        presenter = MainPresenter(service: service)
        delegate = MainViewControllerMock()
        presenter.delegate = delegate
    }

    func whenPresenterLoaded() {
        presenter.viewLoaded()
    }

    func whenRowTapped() {
        let date = Date()
        let new = NewModel(title: "title", description: "description", date: date, imageUrl: "image")
        presenter.rowTaped(new: new)
    }

    func assertTestViewLoaded() {
        XCTAssertNotNil(presenter.newsFeed)
        XCTAssertEqual(presenter.newsFeed[0].title, "title")
        XCTAssertEqual(presenter.newsFeed[0].description, "description")
        XCTAssertEqual(presenter.newsFeed[0].imageUrl, "image")
    }

    func assertRowTaped() {
        XCTAssertTrue(delegate.invokedPushNextViewController)
        XCTAssertEqual(delegate.invokedPushNextViewControllerCount, 1)
    }
}
