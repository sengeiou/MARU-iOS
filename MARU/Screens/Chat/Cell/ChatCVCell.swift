//
//  ChatCVCell.swift
//  MARU
//
//  Created by 오준현 on 2020/08/15.
//  Copyright © 2020 maru. All rights reserved.
//

import UIKit

import Then
import SnapKit
import SwiftKeychainWrapper

class ChatCVCell: UICollectionViewCell {
    
    let id = KeychainWrapper.standard.string(forKey: "id")
    var message: Message?

    let nameLabel = UILabel().then {
        $0.font = Font.chatNameLabel
        $0.numberOfLines = 0
    }
    
    let chatLabel = UILabel().then {
        $0.font = Font.chatLabel
        $0.numberOfLines = 0
    }
    
    let chatBubbleView = UIView().then {
        $0.backgroundColor = .white
        $0.setRounded(radius: 22)
    }
    
    override func prepareForReuse() {
        super.prepareForReuse()
        print(#function)
        nameLabel.text = nil
        chatLabel.text = nil
        chatBubbleView.backgroundColor = .white
        chatBubbleView.setBorder(borderColor: .black22, borderWidth: 0)
        
        updateLayout()
    }
    
    func updateLayout(){
        self.setNeedsLayout()
        self.layoutIfNeeded()
    }

    
    func setConstraint() {
        contentView.addSubview(chatBubbleView)
        contentView.addSubview(chatLabel)
        contentView.addSubview(nameLabel)

        chatLabel.text = message?.message
        chatLabel.sizeToFit()
        nameLabel.text = message?.name
        nameLabel.sizeToFit()
    }
    
    func find() {
        print(#function)
        message?.name == id ? setMyChat() : setOtherChat()
    }
    
    func setMyChat(){
        print(#function, message?.name)
        chatBubbleView.backgroundColor = .veryLightPinkTwo

        nameLabel.snp.makeConstraints { (make) in
            make.top.equalTo(contentView.snp.top)
            make.trailing.equalTo(contentView.snp.trailing).offset(-16)
        }
        
        chatLabel.snp.makeConstraints { (make) in
            make.top.equalTo(nameLabel.snp.bottom).offset(16)
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
    
    func setOtherChat(){
        print(#function, message?.name)
        chatBubbleView.setBorder(borderColor: .black22, borderWidth: 1)
        chatBubbleView.backgroundColor = .white

        nameLabel.snp.makeConstraints { (make) in
            make.top.equalTo(contentView.snp.top)
            make.leading.equalTo(contentView.snp.leading).offset(16)
        }
        
        chatLabel.snp.makeConstraints { (make) in
            make.top.equalTo(nameLabel.snp.bottom).offset(16)
            make.leading.equalTo(contentView.snp.leading).offset(20)
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
