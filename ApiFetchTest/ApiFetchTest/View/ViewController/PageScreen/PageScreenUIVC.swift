//
//  PageScreenUIVC.swift
//  ApiFetchTest
//
//  Created by Himanshu Sharma on 2022/04/02.
//

import Foundation
import UIKit

class PageScreenUIVC : NSObject {
    var view : PageScreenView? {
        didSet{
            setupUI()
        }
    }
    func setupUI() {
        self.view?.navigationItem.title = "API Data"
    }
}
