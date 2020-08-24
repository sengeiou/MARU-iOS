//
//  NewMeetingCVC.swift
//  MARU
//
//  Created by psychehose on 2020/08/20.
//  Copyright © 2020 maru. All rights reserved.
//

import UIKit

class NewMeetingCVC: UICollectionViewCell {
    
    //MARK: - UIComponent
    
    
    let shadowView = UIView().then {
        $0.backgroundColor = .yellow
    }
    
    let bookImg = UIImageView().then {
        $0.image = UIImage(named: "564")
    }
    let bookTitleLabel = UILabel().then {
        $0.text = "기록의 쓸모"
        $0.font = UIFont.systemFont(ofSize: 11, weight: UIFont.Weight.semibold)
        $0.textAlignment = .left
        $0.sizeToFit()
    }
    let bookAuthorLabel = UILabel().then {
        $0.text = "이승희"
        $0.font = UIFont.systemFont(ofSize: 10,weight: UIFont.Weight.light)
        $0.textAlignment = .left

    }
    let bookMeetingMasterLabel = UILabel().then {
        $0.text = "By 라노벨 정균"
        $0.font = UIFont.systemFont(ofSize: 11, weight: UIFont.Weight.medium)
        $0.textColor = .cornflowerBlue
        $0.textAlignment = .right
        $0.sizeToFit()
    }
    
    let explainBox = UILabel().then {
        $0.backgroundColor = .white
        
    }
    
    
    let bookMeetingExplainementLabel = UILabel().then {
        $0.text = "가나다라마바사아자차카타파하가나다라마\n바사아자차카타파하가나다라마바사아자차\n카타파하가나다라마바사아자차카타파하"
        $0.font = UIFont.systemFont(ofSize: 13,weight: UIFont.Weight.semibold)
        $0.textAlignment = .center
        $0.textColor = UIColor.black
        $0.numberOfLines = 3
    }
    
    let leftQuotataionMarkImage = UIImageView().then {
        $0.image = UIImage(named: "qmarkLeft")
    }
    let rightQuotataionMarkImage = UIImageView().then {
        $0.image = UIImage(named: "qmarkRight")
    }
    
    
    //MARK: - Override Init
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        self.addSubview(shadowView)
        shadowView.addSubview(bookImg)
        shadowView.addSubview(bookTitleLabel)
        shadowView.addSubview(bookAuthorLabel)
        shadowView.addSubview(bookMeetingMasterLabel)
        shadowView.addSubview(explainBox)
        explainBox.addSubview(bookMeetingExplainementLabel)
        explainBox.addSubview(leftQuotataionMarkImage)
        explainBox.addSubview(rightQuotataionMarkImage)
        
        
        
       // MARK: - Draw shadow Effect
        
        shadowView.layer.borderWidth = 0.5
        shadowView.layer.cornerRadius = 5
        shadowView.layer.borderColor = UIColor(red: 0.9, green: 0.9, blue: 0.9, alpha: 1.0).cgColor
        shadowView.layer.masksToBounds = false
        shadowView.layer.shadowColor = UIColor.black.cgColor

        shadowView.layer.shadowOffset = .zero
        shadowView.layer.shadowRadius = 1.5
        shadowView.layer.shadowOpacity = 0.28
        shadowView.layer.shadowOffset = CGSize(width: 0.5, height: 0.5)

       // MARK: - AutoLayOut Set
        
        shadowView.snp.makeConstraints { (make) in
            make.top.equalTo(contentView.snp.top).inset(1)
            make.bottom.equalTo(contentView.snp.bottom).inset(1)
            make.leading.equalTo(contentView.snp.leading).inset(1)
            make.trailing   .equalTo(contentView.snp.trailing).inset(1)
        }

        bookImg.snp.makeConstraints { ( make ) in
            make.top.equalTo(shadowView.snp.top).inset(0)
            make.leading.equalTo(shadowView.snp.leading).inset(0)
            make.bottom.equalTo(shadowView.snp.bottom).inset(0)
            make.width.equalTo(80)
        }
        
        bookTitleLabel.snp.makeConstraints { ( make ) in
            make.top.equalTo(shadowView.snp.top).inset(10)
            make.leading.equalTo(bookImg.snp.trailing).inset(-10)
            make.height.equalTo(13)
        }
        
        bookAuthorLabel.snp.makeConstraints { ( make ) in
            make.top.equalTo(shadowView.snp.top).inset(12)
            make.leading.equalTo(bookTitleLabel.snp.trailing).inset(-3)
            make.height.equalTo(12)
        }

        

        explainBox.snp.makeConstraints { ( make ) in
            make.top.equalTo(bookTitleLabel.snp.bottom).inset(-9)
            make.leading.equalTo(bookImg.snp.trailing).inset(-10)
            make.trailing.equalTo(shadowView.snp.trailing).inset(12)
            make.height.equalTo(49)
        }

        leftQuotataionMarkImage.snp.makeConstraints { ( make ) in
            make.top.equalTo(explainBox.snp.top).inset(0)
            make.leading.equalTo(explainBox.snp.leading).inset(0)
            make.width.equalTo(8)
            make.height.equalTo(7)
        }
        rightQuotataionMarkImage.snp.makeConstraints { ( make ) in
            make.bottom.equalTo(explainBox.snp.bottom).inset(0)
            make.trailing.equalTo(explainBox.snp.trailing).inset(0)
            make.width.equalTo(8)
            make.height.equalTo(7)
        }
        bookMeetingExplainementLabel.snp.makeConstraints { ( make ) in
            make.top.equalTo(explainBox.snp.top).inset(0)
            make.bottom.equalTo(explainBox.snp.bottom).inset(0)
            make.leading.equalTo(leftQuotataionMarkImage.snp.trailing).inset(-5)
            make.trailing.equalTo(rightQuotataionMarkImage.snp.leading).inset(0)
        }
        
        bookMeetingMasterLabel.snp.makeConstraints { ( make ) in
            make.top.equalTo(explainBox.snp.bottom).inset(-8)
            make.trailing.equalTo(shadowView.snp.trailing).inset(12)
            make.height.equalTo(11)
            make.width.equalTo(200)
        
        }
        
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }
    
    
}
