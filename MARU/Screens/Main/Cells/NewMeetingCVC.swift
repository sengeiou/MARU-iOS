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
        $0.textAlignment = .left
        $0.sizeToFit()
    }
    
    let explainBox = UILabel().then {
        $0.backgroundColor = .white
        
    }
    
    
    let bookMeetingExplainementLabel = UILabel().then {
        $0.text = "가나다라마바사아자차카파타"
        $0.font = UIFont.systemFont(ofSize: 13,weight: UIFont.Weight.semibold)
        $0.textAlignment = .center
        $0.textColor = UIColor.black
    }
    
    let leftQuotataionMarkImage = UIImageView().then {
        $0.image = UIImage(named: "quotationMarkLeft")
    }
    let rightQuotataionMarkImage = UIImageView().then {
        $0.image = UIImage(named: "quotationMarkRight")
    }
    
    
    //MARK: - Override Init
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        self.addSubview(bookImg)
        self.addSubview(bookTitleLabel)
        self.addSubview(bookAuthorLabel)
        self.addSubview(bookMeetingMasterLabel)
        self.addSubview(explainBox)
        self.addSubview(bookMeetingExplainementLabel)
        self.addSubview(leftQuotataionMarkImage)
        self.addSubview(rightQuotataionMarkImage)
        
        
        
        
        contentView.borderWidth = 0.2
        contentView.borderColor = UIColor(red: 0, green: 0, blue: 0, alpha: 0.4)
        contentView.layer.shadowOffset = .zero
        contentView.layer.shadowRadius = 8
        
        
        bookImg.snp.makeConstraints { ( make ) in
            make.top.equalTo(contentView.snp.top).inset(0)
            make.leading.equalTo(contentView.snp.leading).inset(0)
            make.bottom.equalTo(contentView.snp.bottom).inset(0)
            make.width.equalTo(80)
        }
        
        bookTitleLabel.snp.makeConstraints { ( make ) in
            make.top.equalTo(contentView.snp.top).inset(10)
            make.leading.equalTo(bookImg.snp.trailing).inset(-10)
            make.height.equalTo(13)
        }
        bookAuthorLabel.snp.makeConstraints { ( make ) in
            make.top.equalTo(contentView.snp.top).inset(12)
            make.leading.equalTo(bookTitleLabel.snp.trailing).inset(-3)
            
            make.height.equalTo(12)
        }
        
        bookMeetingMasterLabel.snp.makeConstraints { ( make ) in
            make.top.equalTo(bookTitleLabel.snp.bottom).inset(-7)
            make.leading.equalTo(bookImg.snp.trailing).inset(-10)
            make.height.equalTo(13)
        }
        
        explainBox.snp.makeConstraints { ( make ) in
            make.top.equalTo(bookMeetingMasterLabel.snp.bottom).inset(-10)
            make.leading.equalTo(bookImg.snp.trailing).inset(-11)
            make.trailing.equalTo(contentView.snp.trailing).inset(12)
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
            make.trailing.equalTo(rightQuotataionMarkImage.snp.leading).inset(-5)
            
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
