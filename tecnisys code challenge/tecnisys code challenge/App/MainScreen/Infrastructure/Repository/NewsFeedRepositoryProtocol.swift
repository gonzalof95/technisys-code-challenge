//
//  NewsFeedRepositoryProtocol.swift
//  tecnisys code challenge
//
//  Created by Gonzalo Ivan Fuentes on 05/01/2021.
//

import Foundation
import RxSwift
import AlamofireRSSParser

protocol NewsFeedRepositoryProtocol {
    func getNews() -> Observable<RSSFeed>
}
