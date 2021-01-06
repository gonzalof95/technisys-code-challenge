//
//  NewsView.swift
//  tecnisys code challenge
//
//  Created by Gonzalo Ivan Fuentes on 05/01/2021.
//

import UIKit
import PureLayout

class NewsView: UIView {
    var tableView = UITableView(forAutoLayout: ())

    required init() {
        super.init(frame: .zero)
        setView()
        registerTableViewCells()
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    private func setView() {
        addSubview(tableView)
        
        tableView.autoPinEdgesToSuperviewEdges()
    }

    private func registerTableViewCells() {
        tableView.register(NewsTableViewCell.nib(), forCellReuseIdentifier: "NewsTableViewCell")
    }
}
