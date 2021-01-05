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
}

extension MainViewController: MainViewControllerProtocol {

}
