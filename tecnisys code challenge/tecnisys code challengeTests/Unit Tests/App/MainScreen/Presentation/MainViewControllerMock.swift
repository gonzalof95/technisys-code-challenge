//
//  MainViewControllerMock.swift
//  tecnisys code challengeTests
//
//  Created by Gonzalo Ivan Fuentes on 06/01/2021.
//

@testable import tecnisys_code_challenge

class MainViewControllerMock: MainViewControllerProtocol {
    var invokedSetupView = false
    var invokedSetupViewCount = 0
    var invokedSetupViewParameters: (news: [NewModel], Void)?

    func setupView(_ news: [NewModel]) {
        invokedSetupView = true
        invokedSetupViewCount += 1
        invokedSetupViewParameters = (news, ())
    }

    var invokedPushNextViewController = false
    var invokedPushNextViewControllerCount = 0
    var invokedPushNextViewControllerParameters: (viewController: BaseViewController, Void)?

    func pushNextViewController(_ viewController: BaseViewController) {
        invokedPushNextViewController = true
        invokedPushNextViewControllerCount += 1
        invokedPushNextViewControllerParameters = (viewController, ())
    }

    var invokedShowAnimation = false
    var invokedShowAnimationCount = 0

    func showAnimation() {
        invokedShowAnimation = true
        invokedShowAnimationCount += 1
    }

    var invokedHideAnimation = false
    var invokedHideAnimationCount = 0

    func hideAnimation() {
        invokedHideAnimation = true
        invokedHideAnimationCount += 1
    }
}
