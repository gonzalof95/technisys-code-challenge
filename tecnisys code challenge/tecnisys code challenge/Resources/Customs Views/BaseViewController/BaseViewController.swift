//
//  BaseViewController.swift
//  tecnisys code challenge
//
//  Created by Gonzalo Ivan Fuentes on 05/01/2021.
//

import UIKit
import PureLayout
import Lottie

class BaseViewController: UIViewController {
    let animationView = AnimationView()

    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .customBackgroundColor
    }

    func setNavBar(_ color: UIColor) {
        navigationController?.navigationBar.backgroundColor = color
        navigationController?.navigationBar.barTintColor = color
        navigationItem.backBarButtonItem = UIBarButtonItem(title: "", style: .plain, target: nil, action: nil)
    }

    func setScreenTitle(title: String = TitleConstants.mainScreenTitle) {
        navigationController?.navigationBar.titleTextAttributes = [
            NSAttributedString.Key.foregroundColor: UIColor.white,
            NSAttributedString.Key.font: UIFont(name: Fonts.main, size: 20) as Any]
        navigationItem.largeTitleDisplayMode = .never
        navigationItem.title = title
    }
}

extension BaseViewController: BaseViewControllerProtocol {
    func pushNextViewController(_ viewController: BaseViewController) {
        self.navigationController?.pushViewController(viewController, animated: true)
    }

    func showAnimation() {
        animationView.animation = Animation.named("loading")
        animationView.frame = view.bounds
        animationView.backgroundColor = .customColorMain
        animationView.contentMode = .scaleAspectFit
        animationView.loopMode = .loop
        animationView.play()
        view.addSubview(animationView)
    }

    func hideAnimation() {
        animationView.stop()
        animationView.removeFromSuperview()
    }
}
