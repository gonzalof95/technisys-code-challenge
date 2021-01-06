//
//  BaseViewControllerProtocolTest.swift
//  tecnisys code challengeTests
//
//  Created by Gonzalo Ivan Fuentes on 06/01/2021.
//

import XCTest
@testable import tecnisys_code_challenge

final class BaseViewControllerProtocolTest: XCTestCase {
    var mock: BaseViewControllerProtocolMock!

    override func tearDown() {
        super.tearDown()
        mock = nil
    }

    func testShowAnimationInvoked() {
        givenMock()
        whenShowAnimation()
        assertTestShowAnimation()
    }

    func testHideAnimation() {
        givenMock()
        whenHideAnimation()
        assertTestHideAnimation()
    }

    func testPushNextViewController() {
        givenMock()
        let mockViewController = BaseViewController()
        whenNextViewControllerPushed(mockViewController)
        assertTestNextViewControllerPushed(mockViewController)
    }
}

private extension BaseViewControllerProtocolTest {
    func givenMock() {
        mock = BaseViewControllerProtocolMock()
    }

    func whenShowAnimation() {
        mock.showAnimation()
    }

    func whenHideAnimation() {
        mock.hideAnimation()
    }

    func whenNextViewControllerPushed(_ mockViewController: BaseViewController) {
        mock.pushNextViewController(mockViewController)
    }

    func assertTestShowAnimation() {
        XCTAssertTrue(mock.invokedShowAnimation)
        XCTAssertEqual(mock.invokedShowAnimationCount, 1)
    }

    func assertTestHideAnimation() {
        XCTAssertTrue(mock.invokedHideAnimation)
        XCTAssertEqual(mock.invokedHideAnimationCount, 1)
    }

    func assertTestNextViewControllerPushed(_ mockViewController: BaseViewController) {
        XCTAssertTrue(mock.invokedPushNextViewController)
        XCTAssertEqual(mock.invokedPushNextViewControllerCount, 1)
        XCTAssertEqual(mock.invokedPushNextViewControllerParameters, mockViewController)
    }
}
