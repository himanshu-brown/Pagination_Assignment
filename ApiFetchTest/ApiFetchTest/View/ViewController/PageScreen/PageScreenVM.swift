//
//  PageScreenVM.swift
//  ApiFetchTest
//
//  Created by Himanshu Sharma on 2022/04/02.
//

import Foundation
import UIKit

class PageScreenVM : NSObject {
    var view : PageScreenView? {
        didSet {
            self.view?.tableView.dataSource = self
            self.view?.tableView.delegate = self
            self.view?.tableView.register(UINib(nibName: "CustomTVC", bundle: nil), forCellReuseIdentifier: "CustomTVC")
            DataManager.shared.getData { ImageList in
                list = ImageList
                DispatchQueue.main.async {
                    self.view?.tableView.reloadData()
                }
            }
        }
    }
}
private var list = [ImageList]()
extension PageScreenVM : UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return list.count
    }
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = self.view?.tableView.dequeueReusableCell(withIdentifier: "CustomTVC", for: indexPath) as! CustomTVC
        cell.titleLabel.text = list[indexPath.row].author
        guard let url = URL(string: list[indexPath.row].download_url ?? "") else { return UITableViewCell() }
        DispatchQueue.main.async {
            if let data = try? Data(contentsOf: url){
                cell.picture.image = UIImage(data: data)
            }
        }
        return cell
    }
}
extension PageScreenVM : UITableViewDelegate {
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 110
    }
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let vc = PageDetailScreenVC.`init`()
        vc.authorText = list[indexPath.row].author
        vc.widthText = list[indexPath.row].width
        vc.heightText = list[indexPath.row].height
        vc.url = list[indexPath.row].download_url
        self.view?.navigationController?.pushViewController(vc, animated: true)
    }
}

extension PageScreenVM : UIScrollViewDelegate {
    func scrollViewDidScroll(_ scrollView: UIScrollView) {
        let position = scrollView.contentOffset.y
        if position > ((self.view?.tableView.contentSize.height)!-100-scrollView.frame.size.height) {
            DataManager.shared.getData { ImageList in
                list.append(contentsOf: ImageList)
            }
            DispatchQueue.main.async {
                self.view?.tableView.reloadData()
            }
        }
    }
}


