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
            self?.mapResponseToFeed(feed: response)
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

    private func mapResponseToFeed(feed: RSSFeed) {
        for item in feed.items {
            guard let imageData = item.enclosures else { return }
            var imageUrl = ""
            for item in imageData {
                let pair = item.first{ $0.key == "url" }
                imageUrl = pair?.value ?? ""
                print(imageUrl)
            }

            let new = NewModel(title: item.title,
                               description: item.itemDescription,
                               date: item.pubDate,
                               imageUrl: imageUrl)
            newsFeed.append(new)
        }
    }
}
