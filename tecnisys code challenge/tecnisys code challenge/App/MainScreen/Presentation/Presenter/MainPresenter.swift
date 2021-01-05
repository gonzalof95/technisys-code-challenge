//
//  MainPresenter.swift
//  tecnisys code challenge
//
//  Created by Gonzalo Ivan Fuentes on 05/01/2021.
//

import Foundation
import AlamofireRSSParser

class MainPresenter {
    weak var delegate: MainViewControllerProtocol?
    let client: NetworkService

    required init(_ client: NetworkService) {
        self.client = client
    }

    func viewLoaded() {
        getFeed()
    }

    private func getFeed() {
        client.execute(path: "https://www.telegraph.co.uk/football/rss.xml") { (feed: RSSFeed?, status: NetworkResponseStatus) in
            print(feed)
            print(status)
        }
    }
}
