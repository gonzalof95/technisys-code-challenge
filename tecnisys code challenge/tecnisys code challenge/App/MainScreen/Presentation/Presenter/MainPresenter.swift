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
    let client: NetworkService

    required init(_ client: NetworkService) {
        self.client = client
    }

    func viewLoaded() {
        getFeed()
    }

    private func getFeed() {
        client.execute(url: "https://www.telegraph.co.uk/football/rss.xml").subscribe(onNext: { [weak self] response in
            print(response)
            DispatchQueue.main.async {
            }
        }, onError: { error in
            debugPrint(error)
        })
        .disposed(by: disposebag)
    }
}
