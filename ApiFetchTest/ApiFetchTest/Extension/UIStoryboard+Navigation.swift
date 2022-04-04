//
//  UIStoryboard+Navigation.swift
//  ApiFetchTest
//
//  Created by Himanshu Sharma on 2022/04/02.
//

import Foundation
import UIKit

extension UIStoryboard {
    static let splash = UIStoryboard(name: "Splash", bundle: .main)
    static let pageScreen = UIStoryboard(name: "PageScreen", bundle: .main)
    func instanceOf<T: UIViewController>(viewController: T.Type) -> T? {
        let x = String(describing: viewController.self)
        let vc = self.instantiateViewController(withIdentifier: x) as? T
        vc?.modalPresentationStyle = .fullScreen
        return vc
    }
    static func makeNavigationControllerAsRootVC( _ viewController: UIViewController) {
        let navigation = UINavigationController(rootViewController: viewController)
        navigation.modalPresentationStyle = .fullScreen
        AppDelegate.shared().window?.rootViewController = navigation
        AppDelegate.shared().window?.makeKeyAndVisible()
    }
}
