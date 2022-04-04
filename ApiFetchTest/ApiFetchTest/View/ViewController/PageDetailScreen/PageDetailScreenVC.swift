//
//  PageDetailScreenVC.swift
//  ApiFetchTest
//
//  Created by Himanshu Sharma on 2022/04/02.
//

import Foundation
import UIKit

protocol PageDetailScreenView : UIViewController {
    var imageView : UIImageView! { get }
    var author : UILabel! { get }
    var authorText : String { get }
    var width : UILabel! { get }
    var widthText : Int { get }
    var height : UILabel! { get }
    var heightText : Int { get }
}

class PageDetailScreenVC : UIViewController, PageDetailScreenView {
    @IBOutlet var author : UILabel!
    @IBOutlet var width : UILabel!
    @IBOutlet var height : UILabel!
    @IBOutlet var imageView : UIImageView!
    var authorText : String = ""
    var widthText : Int = 0
    var heightText : Int = 0
    var url : String = ""
    var viewModel : PageDetailScreenVM!
    var uiVC : PageDetailScreenUIVC!
    override func viewDidLoad() {
        super.viewDidLoad()
        let localURL = URL(string: url)
        DispatchQueue.main.async { [self] in
            if let data = try? Data(contentsOf: localURL!){
                imageView.image = UIImage(data: data)
            }
        }
        viewModel.view = self
        uiVC.view = self
    }
    class func `init`() -> PageDetailScreenVC {
        let vc = UIStoryboard.pageScreen.instanceOf(viewController: PageDetailScreenVC.self)!
        vc.viewModel = PageDetailScreenVM()
        vc.uiVC = PageDetailScreenUIVC()
        return vc
    }
}
