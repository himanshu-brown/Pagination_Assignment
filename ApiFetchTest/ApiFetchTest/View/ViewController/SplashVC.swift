//
//  SplashVC.swift
//  ApiFetchTest
//
//  Created by Himanshu Sharma on 2022/04/02.
//

import Foundation
import UIKit

class SplashVC : UIViewController {
    override func viewDidLoad() {
        super.viewDidLoad()
            loadScreen()
    }
    func loadScreen() {
        let vc = PageScreenVC.`init`()
        UIStoryboard.makeNavigationControllerAsRootVC(vc)
    }
}
