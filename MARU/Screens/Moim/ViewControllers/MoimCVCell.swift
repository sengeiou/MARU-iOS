//
//  MoimCVCell.swift
//  MARU
//
//  Created by 박주연 on 2020/08/20.
//  Copyright © 2020 maru. All rights reserved.
//

import UIKit

class MoimCVCell: UICollectionViewCell {
    
    static let identifier: String = "MoimCVCell"
    
    @IBOutlet weak var backBookIcon: UIImageView!
    @IBOutlet weak var bookImg: UIImageView!
    @IBOutlet weak var bookFrontImg: UIImageView!
    
    @IBOutlet weak var bookNameLabel: UILabel!
    @IBOutlet weak var authorLabel: UILabel!
    @IBOutlet weak var countTimeLabel: UILabel!
    @IBOutlet weak var bookIntroduceLabel: UILabel!
    
    @IBOutlet weak var chatNickNameLabel: UILabel!
    @IBOutlet weak var chatTimeLabel: UILabel!
    @IBOutlet weak var chattingLabel: UILabel!
    @IBOutlet weak var chatCountLabel: UILabel!
    
    @IBOutlet weak var backView: UIView!
    
    func viewShadow(){
        
        backView.layer.cornerRadius = 10.0
        backView.layer.shadowColor = CGColor.init(srgbRed: 0, green: 0, blue: 0, alpha: 0.16)
        backView.layer.shadowOffset = CGSize(width: 0, height: 0)
        backView.layer.shadowRadius = 3
        backView.layer.shadowOpacity = 10
        backView.layer.shadowPath = UIBezierPath(roundedRect:
            backView.bounds, cornerRadius: backView.layer.cornerRadius).cgPath
    }
    
    override func awakeFromNib() {
        super.awakeFromNib()

        viewShadow()
    }
    
}
