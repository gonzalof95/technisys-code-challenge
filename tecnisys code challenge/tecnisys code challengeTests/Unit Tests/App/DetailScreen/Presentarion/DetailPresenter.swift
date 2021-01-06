//
//  DetailPresenter.swift
//  tecnisys code challengeTests
//
//  Created by Gonzalo Ivan Fuentes on 06/01/2021.
//

import XCTest
@testable import tecnisys_code_challenge

final class DetailPresenterTest: XCTestCase {
    var presenter: DetailPresenter!
    var delegate: DetailViewControllerProtocolMock!

    override func tearDown() {
        super.tearDown()
        presenter = nil
        delegate = nil
    }

    func testViewLoaded() {
        givenMocks()
    }
}

private extension DetailPresenterTest {
    func givenMocks() {
        let date = Date()
        let new = NewModel(title: "title", description: "description", date: date, imageUrl: "iamge")
        presenter = DetailPresenter(with: new)
        delegate = DetailViewControllerProtocolMock()
        presenter.delegate = delegate
    }

    func whenViewLoaded() {
        presenter.viewLoaded()
    }

    func assertViewLoaded() {
        XCTAssertTrue(delegate.invokedSetupView)
        XCTAssertEqual(delegate.invokedSetupViewCount, 1)
        XCTAssertNotNil(presenter.new)
        XCTAssertEqual(presenter.new.title, "title")
        XCTAssertEqual(presenter.new.description, "description")
        XCTAssertEqual(presenter.new.imageUrl, "image")
    }
}
