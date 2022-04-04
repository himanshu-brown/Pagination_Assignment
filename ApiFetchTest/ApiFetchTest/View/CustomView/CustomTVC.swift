//
//  CustomTVC.swift
//  ApiFetchTest
//
//  Created by Himanshu Sharma on 2022/04/02.
//

import UIKit
import Foundation

class CustomTVC: UITableViewCell {
    
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet var picture : UIImageView!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
        picture.layer.cornerRadius = 10
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    override func prepareForReuse() {
        titleLabel.text = ""
        picture.image = UIImage()
    }
    
}
