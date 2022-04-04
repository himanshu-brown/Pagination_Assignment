//
//  PageDetailScreenUIVC.swift
//  ApiFetchTest
//
//  Created by Himanshu Sharma on 2022/04/03.
//

import Foundation
import UIKit

class PageDetailScreenUIVC : NSObject {
    var view : PageDetailScreenView? {
        didSet {
            setupUI()
        }
    }
    func setupUI() {
        self.view?.imageView.layer.cornerRadius = 10
        self.view?.author?.text = self.view?.authorText
        self.view?.width?.text = String(self.view!.widthText)
        self.view?.height?.text = String(self.view!.heightText)
    }
}
