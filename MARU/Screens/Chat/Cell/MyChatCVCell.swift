//
//  MyChatCVCell.swift
//  MARU
//
//  Created by 오준현 on 2020/08/18.
//  Copyright © 2020 maru. All rights reserved.
//

import UIKit

import Then
import SnapKit
import SwiftKeychainWrapper

class MyChatCVCell: UICollectionViewCell {
    
    let id = KeychainWrapper.standard.string(forKey: "id")
    var message: Message?
    
    let chatLabel = UILabel().then {
        $0.font = Font.chatLabel
        $0.numberOfLines = 0
    }
    
    let chatBubbleView = UIView().then {
        $0.backgroundColor = .white
        $0.setRounded(radius: 16)
    }
    
    override func prepareForReuse() {
        super.prepareForReuse()

        chatLabel.text = nil
        chatBubbleView.backgroundColor = .white
        chatBubbleView.setBorder(borderColor: .black22, borderWidth: 0)
        chatBubbleView.frame = CGRect.init()
        updateLayout()
    }
    
    func updateLayout(){
        self.setNeedsLayout()
        self.layoutIfNeeded()
    }

    
    func setConstraint() {
        contentView.addSubview(chatBubbleView)
        contentView.addSubview(chatLabel)

        chatLabel.text = message?.message
        chatLabel.sizeToFit()
    }
    
    func find() {
        setMyChat()
    }
    
    func setMyChat(){
        chatBubbleView.backgroundColor = .veryLightPinkTwo
        
        chatLabel.snp.makeConstraints { (make) in
            make.top.equalTo(contentView.snp.top).offset(11)
            make.trailing.equalTo(contentView.snp.trailing).offset(-20)
            make.width.lessThanOrEqualTo(contentView.snp.width).offset(-100)
        }
        chatLabel.sizeToFit()
        
        chatBubbleView.snp.makeConstraints { (make) in
            make.top.equalTo(chatLabel.snp.top).offset(-11)
            make.leading.equalTo(chatLabel.snp.leading).offset(-13)
            make.trailing.equalTo(chatLabel.snp.trailing).offset(13)
            make.bottom.equalTo(chatLabel.snp.bottom).offset(11)
        }
    }
    
}
