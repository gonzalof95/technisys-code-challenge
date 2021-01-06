//
//  NetworkingServiceProtocol.swift
//  tecnisys code challenge
//
//  Created by Gonzalo Ivan Fuentes on 06/01/2021.
//

import RxSwift
import AlamofireRSSParser

protocol NetworkServiceProtocol {
    func execute(_ url: String) -> Observable<RSSFeed>
}
