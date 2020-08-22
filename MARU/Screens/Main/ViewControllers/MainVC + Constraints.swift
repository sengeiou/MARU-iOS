//
//  MainVC + Constraints.swift
//  MARU
//
//  Created by psychehose on 2020/08/20.
//  Copyright © 2020 maru. All rights reserved.
//

import UIKit

extension MainVC {
    
    func layout() {
        
        self.view.addSubview(contentView)
        self.contentView.addSubview(popularMeetingColletionView)
        self.contentView.addSubview(newMeetingCollectionView)
        self.contentView.addSubview(backImageView)
        self.contentView.addSubview(popularMeetingLabel)
        self.contentView.addSubview(newMeetingLabel)
        
        self.backImageView.addSubview(backImageViewScrim)
        self.backImageView.addSubview(bookLogoImageView)
        self.backImageView.addSubview(commentLabel)
        self.backImageView.addSubview(mypageButton)
        
        self.contentView.addSubview(searchLabel)
        self.contentView.addSubview(searchImage)
        self.contentView.addSubview(searchTextField)
        
       
        
    
        
        popularMeetingColletionView.delegate = self
        popularMeetingColletionView.dataSource = self
        newMeetingCollectionView.delegate = self
        newMeetingCollectionView.dataSource = self
        
        contentView.snp.makeConstraints{ ( make ) in
            make.top.equalToSuperview()
            make.bottom.equalToSuperview()
            make.leading.equalToSuperview()
            make.trailing.equalToSuperview()
        }
        backImageView.snp.makeConstraints { (make) in
            make.top.equalTo(contentView.snp.top)
            make.leading.equalTo(contentView.snp.leading)
            make.trailing.equalTo(contentView.snp.trailing)
            make.height.equalTo(250)
        }
        backImageViewScrim.snp.makeConstraints { (make) in
            make.top.equalTo(backImageView.snp.top)
            make.leading.equalTo(backImageView.snp.leading)
            make.trailing.equalTo(backImageView.snp.trailing)
            make.bottom.equalTo(backImageView.snp.bottom)
        }
        mypageButton.snp.makeConstraints { (make) in
            make.top.equalTo(backImageView.snp.top).inset(60)
            make.trailing.equalTo(backImageView.snp.trailing).inset(16)
            make.height.equalTo(12)
            make.width.equalTo(22)
        }
        bookLogoImageView.snp.makeConstraints { (make) in
            make.top.equalTo(backImageView.snp.top).inset(124)
            make.height.equalTo(28)
            make.width.equalTo(29)
            make.leading.equalTo(backImageView.snp.leading).inset(18)
        }
        commentLabel.snp.makeConstraints { (make) in
            make.top.equalTo(bookLogoImageView.snp.bottom).inset(-14)
            make.bottom.equalTo(backImageView.snp.bottom).inset(34)
            make.leading.equalTo(backImageView.snp.leading).inset(16)
            make.trailing.equalTo(backImageView.snp.trailing)
            
        }
        
        searchLabel.snp.makeConstraints { (make) in
            make.top.equalTo(commentLabel.snp.bottom).inset(-15)
            make.leading.equalTo(contentView.snp.leading).inset(16)
            make.trailing.equalTo(contentView.snp.trailing).inset(16)
            make.height.equalTo(38)
        }
        
        popularMeetingLabel.snp.makeConstraints { (make) in
            make.top.equalTo(backImageView.snp.bottom).inset(-52)
            make.leading.equalTo(contentView.snp.leading).inset(16)
            make.trailing.equalTo(contentView.snp.trailing)
        }
        popularMeetingColletionView.snp.makeConstraints { (make) in
            make.top.equalTo(popularMeetingLabel.snp.bottom).inset(-11)
            make.leading.equalTo(contentView.snp.leading)
            make.trailing.equalTo(contentView.snp.trailing)
            make.width.equalTo(self.view.frame.width)
            make.height.equalTo(170)
        }
        newMeetingLabel.snp.makeConstraints { (make) in
            make.top.equalTo(popularMeetingColletionView.snp.bottom).inset(-34)
            make.leading.equalTo(contentView.snp.leading).inset(16)
            make.trailing.equalTo(contentView.snp.trailing)
        }
        newMeetingCollectionView.snp.makeConstraints { (make) in
            make.top.equalTo(newMeetingLabel.snp.bottom).inset(-11)
            make.bottom.equalTo(contentView.snp.bottom).inset(0)
            make.width.equalTo(self.view.frame.width)
        }
        
        searchImage.snp.makeConstraints { (make) in
            make.top.equalTo(searchLabel.snp.top).inset(11)
            make.leading    .equalTo(searchLabel.snp.leading).inset(10)
            make.height.equalTo(16)
            make.width.equalTo(16)
        }
        searchTextField.snp.makeConstraints { (make) in
            make.top.equalTo(searchLabel.snp.top).inset(11)
            make.leading    .equalTo(searchImage.snp.trailing).inset(-8)
            make.trailing.equalTo(searchLabel.snp.trailing)
            make.height.equalTo(16)
        }
    
        
        
    }
}
