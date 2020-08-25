//
//  SearchResultTVCell.swift
//  MARU
//
//  Created by 이윤진 on 2020/08/18.
//  Copyright © 2020 maru. All rights reserved.
//

import UIKit

class SearchResultTVCell: UITableViewCell {

//    let shadowView = UIView().then {
//        $0.backgroundColor = .white
//    }
   
    
    @IBOutlet weak var searchBookImage: UIImageView! // 책 이미지
    @IBOutlet weak var searchBookName: UILabel! // 책 제목
    @IBOutlet weak var searchBookAuthor: UILabel! // 책 저자
    @IBOutlet weak var searchMoimZang: UILabel! // 방장 이름
    @IBOutlet weak var searchMoimValidate: UILabel! // 유효기간 날짜 수(Int)
    @IBOutlet weak var searchMoimIntro: UILabel! // 소개 문구
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
//        shadowView.layer.cornerRadius = 5.0
//        shadowView.layer.shadowColor = UIColor.black.cgColor
//        shadowView.layer.shadowOffset = CGSize(width: 0, height: 0)
//        shadowView.layer.shadowRadius = 1.5
//        shadowView.layer.shadowOpacity = 0.3
//        shadowView.layer.shadowPath = UIBezierPath(roundedRect: shadowView.bounds, cornerRadius: shadowView.layer.cornerRadius).cgPath
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
//    
//    override func layoutSubviews() {
//        super.layoutSubviews()
//
//        contentView.frame = contentView.frame.inset(by: UIEdgeInsets(top: 3, left: 0, bottom: 18, right: 3))
//    }

}
