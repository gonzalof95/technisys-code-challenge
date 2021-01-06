//
//  NewsFeedRepository.swift
//  tecnisys code challenge
//
//  Created by Gonzalo Ivan Fuentes on 05/01/2021.
//

import Foundation
import AlamofireRSSParser

class NewsFeedRepository {
    private let networkService: NetworkService
    private let url: String

    init(networkService: NetworkService = NetworkService(), url: String) {
        self.networkService = networkService
        self.url = url
    }
}
