//
//  SearchEntryMoimVC.swift
//  MARU
//
//  Created by 이윤진 on 2020/08/17.
//  Copyright © 2020 maru. All rights reserved.
//

import UIKit

class SearchEntryMoimVC: UIViewController{
   
    @IBOutlet weak var shadowImageView: UIView!
    @IBOutlet weak var entryBookImage: UIImageView!
    override func viewDidLoad() {
        super.viewDidLoad()
        // MARK: - boxview shadow attributes
        shadowImageView.layer.cornerRadius = 10.0
        shadowImageView.layer.shadowColor = UIColor.black.cgColor
        shadowImageView.layer.shadowOffset = CGSize(width: 0, height: 0)
        shadowImageView.layer.shadowRadius = 10.0
        shadowImageView.layer.shadowOpacity = 0.3
        shadowImageView.layer.shadowPath = UIBezierPath(roundedRect: shadowImageView.bounds, cornerRadius: shadowImageView.layer.cornerRadius).cgPath
        
    }
}

