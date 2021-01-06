//
//  MainViewController.swift
//  tecnisys code challenge
//
//  Created by Gonzalo Ivan Fuentes on 05/01/2021.
//

import UIKit
import PureLayout

class MainViewController: BaseViewController {
    var presenter: MainPresenter?
    var newsView: NewsView?
    var newsArray: [NewModel] = []

    init(with presenter: MainPresenter) {
        super.init(nibName: nil, bundle: nil)
        self.presenter = presenter
        self.presenter?.delegate = self
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        presenter?.viewLoaded()
    }

    override func viewWillAppear(_ animated: Bool) {
        setNavBar(.customColorMain)
        setScreenTitle()
    }

    private func setupTable(_ news: [NewModel]) {
        newsArray = news

        self.newsView = NewsView()
        guard let strongCustomView = newsView else { return }

        strongCustomView.tableView.delegate = self
        strongCustomView.tableView.dataSource = self
        view.addSubview(strongCustomView)
        newsView?.autoPinEdgesToSuperviewEdges()
    }

    @objc func buttonTapped(sender: UIButton) {
        presenter?.rowTaped(new: newsArray[sender.tag])
    }
}

extension MainViewController: MainViewControllerProtocol {
    func setupView(_ news: [NewModel]) {
        setupTable(news)
    }
}
