//
//  PageScreenVC.swift
//  ApiFetchTest
//
//  Created by Himanshu Sharma on 2022/04/02.
//

import Foundation
import UIKit

protocol PageScreenView : UIViewController {
    var tableView : UITableView! { get }
}

class PageScreenVC : UIViewController, PageScreenView {
    
    @IBOutlet var tableView : UITableView!
    var viewModel : PageScreenVM!
    var uiVC : PageScreenUIVC!
    override func viewDidLoad() {
        super.viewDidLoad()
        viewModel.view = self
        uiVC.view = self
    }
    class func `init`() -> PageScreenVC {
        let vc = UIStoryboard.pageScreen.instanceOf(viewController: PageScreenVC.self)!
        vc.viewModel = PageScreenVM()
        vc.uiVC = PageScreenUIVC()
        return vc
    }
}
