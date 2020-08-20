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
        
        self.backImageView.addSubview(bookLogoImageView)
        self.backImageView.addSubview(commentLabel)
        self.backImageView.addSubview(mypageButton)
        self.backImageView.addSubview(popularMeetingLabel)
        self.backImageView.addSubview(newMeetingLabel)
        
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
            make.height.equalTo(self.view.frame.height * (250/812))
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
            make.height.equalTo(ceil(self.view.frame.height * (169/812)))
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
        
        
        
    }
}
