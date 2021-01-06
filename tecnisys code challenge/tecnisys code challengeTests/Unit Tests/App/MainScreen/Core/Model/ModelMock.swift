//
//  ModelMock.swift
//  tecnisys code challengeTests
//
//  Created by Gonzalo Ivan Fuentes on 06/01/2021.
//

import RxSwift
@testable import tecnisys_code_challenge

class NewMock {
    func getMock() -> Observable<[NewModel]> {
        return Observable.create { observer -> Disposable in
            let response = self.getMockData()
            observer.onNext(response)

            return Disposables.create()
        }
    }

    func getMockData() -> [NewModel] {
        let date = Date()
        let new = NewModel(title: "title",
                           description: "description",
                           date: date,
                           imageUrl: "image")
        return [new]
    }
}
