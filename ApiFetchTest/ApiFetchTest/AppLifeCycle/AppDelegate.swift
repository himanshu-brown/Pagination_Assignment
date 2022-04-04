//
//  AppDelegate.swift
//  ApiFetchTest
//
//  Created by Himanshu Sharma on 2022/04/02.
//

import UIKit

@main
class AppDelegate: UIResponder, UIApplicationDelegate {

    var window: UIWindow?

    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        // Override point for customization after application launch.
        let  main = UIStoryboard(name:"Splash", bundle: nil)
        let vc = main.instantiateViewController(withIdentifier: "SplashVC")
        let navVC = UINavigationController(rootViewController: vc)
        AppDelegate.shared().window?.rootViewController = navVC
        AppDelegate.shared().window?.makeKeyAndVisible()
        return true
    }

    class func shared() -> AppDelegate {
        return UIApplication.shared.delegate as! AppDelegate
    }


}
