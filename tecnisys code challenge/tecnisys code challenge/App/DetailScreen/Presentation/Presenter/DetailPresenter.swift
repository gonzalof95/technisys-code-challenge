//
//  DetailPresenter.swift
//  tecnisys code challenge
//
//  Created by Gonzalo Ivan Fuentes on 06/01/2021.
//

import Foundation

class DetailPresenter {
    weak var delegate: DetailViewControllerProtocol?
    let new: NewModel

    init(with new: NewModel) {
        self.new = new
    }

    func viewLoaded() {
        delegate?.setupView(new)
    }
}
