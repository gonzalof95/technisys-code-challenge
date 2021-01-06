//
//  NetworkServiceTest.swift
//  tecnisys code challengeTests
//
//  Created by Gonzalo Ivan Fuentes on 06/01/2021.
//

import XCTest
import RxSwift
@testable import tecnisys_code_challenge

final class NetworkServiceTest: XCTestCase {
    var mock: NetworkServiceMock!

    override func tearDown() {
        super.tearDown()
        mock = nil
    }

    func testExecute() {
        givenMock()
        let response = execute()
        assertExecute(response)
    }
}

private extension NetworkServiceTest {
    func givenMock() {
        mock = NetworkServiceMock()
    }

    func execute() -> Observable<[NewModel]> {
        return mock.execute("url")
    }

    func assertExecute(_ response: Observable<[NewModel]>) {
        XCTAssertTrue(mock.invokedExecute)
        XCTAssertEqual(mock.invokedExecuteCount, 1)
        XCTAssertNotNil(response)
    }
}
