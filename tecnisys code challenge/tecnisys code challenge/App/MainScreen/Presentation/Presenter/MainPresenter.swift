//
//  MainPresenter.swift
//  tecnisys code challenge
//
//  Created by Gonzalo Ivan Fuentes on 05/01/2021.
//

import Foundation
import RxSwift

class MainPresenter {
    weak var delegate: MainViewControllerProtocol?
    private let disposebag = DisposeBag()
    private let service: NewsFeedServiceProtocol
    var newsFeed: [NewModel] = []

    required init(service: NewsFeedServiceProtocol) {
        self.service = service
    }

    func viewLoaded() {
        getFeed()
    }

    private func getFeed() {
        delegate?.showAnimation()
        service.execute().subscribe(onNext: { [weak self] response in
            self?.newsFeed = response
            DispatchQueue.main.async {
                self?.delegate?.hideAnimation()
                guard let news = self?.newsFeed else { return }
                self?.delegate?.setupView(news)
            }
        }, onError: { error in
            debugPrint(error)
        })
        .disposed(by: disposebag)
    }

    func rowTaped(new: NewModel) {
        let presenter = DetailPresenter(with: new)
        delegate?.pushNextViewController(DetailViewController(with: presenter))
    }
}
