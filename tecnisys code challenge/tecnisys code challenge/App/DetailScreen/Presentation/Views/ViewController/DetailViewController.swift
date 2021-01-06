//
//  DetailViewController.swift
//  tecnisys code challenge
//
//  Created by Gonzalo Ivan Fuentes on 06/01/2021.
//

import UIKit
import PureLayout

class DetailViewController: BaseViewController {
    var presenter: DetailPresenter?
    var detailView: DetailView?

    init(with presenter: DetailPresenter) {
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

    private func configureView(_ new: NewModel) {
        self.detailView = DetailView()
        guard let strongCustomView = detailView else { return }

        view.addSubview(strongCustomView)
        detailView?.autoPinEdgesToSuperviewEdges()
        detailView?.configure(new: new)
    }
}

extension DetailViewController: DetailViewControllerProtocol {
    func setupView(_ new: NewModel) {
        configureView(new)
    }
}
