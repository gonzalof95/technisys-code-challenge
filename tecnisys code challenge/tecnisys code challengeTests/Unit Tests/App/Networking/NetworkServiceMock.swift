//
//  NetworkServiceMock.swift
//  tecnisys code challengeTests
//
//  Created by Gonzalo Ivan Fuentes on 06/01/2021.
//

import Foundation
import RxSwift
import AlamofireRSSParser
@testable import tecnisys_code_challenge

final class NetworkServiceMock: NetworkServiceProtocol {
    var invokedExecute = false
    var invokedExecuteCount = 0

    func execute(_ url: String) -> Observable<[NewModel]> {
        invokedExecute = true
        invokedExecuteCount += 1

        return Observable.create { observer -> Disposable in
            let mock = NewMock()
            let mockResponse = mock.getMockData()
            observer.onNext(mockResponse)

            return Disposables.create()
        }
    }
}
