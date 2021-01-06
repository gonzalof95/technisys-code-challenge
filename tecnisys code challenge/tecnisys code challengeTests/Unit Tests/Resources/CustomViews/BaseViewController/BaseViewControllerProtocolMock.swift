//
//  BaseViewControllerProtocolMock.swift
//  tecnisys code challengeTests
//
//  Created by Gonzalo Ivan Fuentes on 06/01/2021.
//

@testable import tecnisys_code_challenge

class BaseViewControllerProtocolMock: BaseViewControllerProtocol {
    var invokedPushNextViewController = false
    var invokedPushNextViewControllerCount = 0
    var invokedPushNextViewControllerParameters: BaseViewController?

    func pushNextViewController(_ viewController: BaseViewController) {
        invokedPushNextViewController = true
        invokedPushNextViewControllerCount += 1
        invokedPushNextViewControllerParameters = viewController
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
