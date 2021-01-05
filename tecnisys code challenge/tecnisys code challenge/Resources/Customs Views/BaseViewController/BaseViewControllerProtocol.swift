//
//  BaseViewControllerProtocol.swift
//  tecnisys code challenge
//
//  Created by Gonzalo Ivan Fuentes on 05/01/2021.
//

protocol BaseViewControllerProtocol: AnyObject {
    func pushNextViewController(_ viewController: BaseViewController)
    func showAnimation()
    func hideAnimation()
}
