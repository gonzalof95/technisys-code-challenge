//
//  NewsFeedRepositoryProtocol.swift
//  tecnisys code challenge
//
//  Created by Gonzalo Ivan Fuentes on 05/01/2021.
//

import Foundation
import RxSwift

protocol NewsFeedRepositoryProtocol {
    func getNews() -> Observable<[NewModel]>
}
