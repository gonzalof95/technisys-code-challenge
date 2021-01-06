//
//  MainPresenter.swift
//  tecnisys code challenge
//
//  Created by Gonzalo Ivan Fuentes on 05/01/2021.
//

import Foundation
import RxSwift
import AlamofireRSSParser

class MainPresenter {
    weak var delegate: MainViewControllerProtocol?
    private let disposebag = DisposeBag()
    private let service: NewsFeedServiceProtocol


    required init(service: NewsFeedServiceProtocol) {
        self.service = service
    }

    func viewLoaded() {
        getFeed()
    }

    private func getFeed() {
        service.execute().subscribe(onNext: { [weak self] response in
            print(response)
            DispatchQueue.main.async {
            }
        }, onError: { error in
            debugPrint(error)
        })
        .disposed(by: disposebag)
    }
}
