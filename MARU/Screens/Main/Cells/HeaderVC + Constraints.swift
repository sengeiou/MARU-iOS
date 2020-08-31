//
//  HeaderVC + Constraints.swift
//  MARU
//
//  Created by psychehose on 2020/08/25.
//  Copyright © 2020 maru. All rights reserved.
//

import UIKit


extension HeaderVC {
    
    func headerLayout(){
        
        self.addSubview(headerContentView)
        headerContentView.addSubview(popularMeetingColletionView)
        self.addSubview(backImageView)
        self.addSubview(popularMeetingLabel)
        self.addSubview(newMeetingLabel)
        
        self.addSubview(backImageViewScrim)
        self.addSubview(bookLogoImageView)
        self.addSubview(commentLabel)
        self.addSubview(mypageButton)
        
        self.addSubview(searchLabel)
        self.addSubview(searchImage)
        self.addSubview(searchTextField)
        
        

        popularMeetingColletionView.delegate = self
        popularMeetingColletionView.dataSource = self
        

        headerContentView.snp.makeConstraints{ ( make ) in
            make.top.equalTo(self.snp.top)
            make.bottom.equalTo(self.snp.bottom)
            make.leading.equalTo(self.snp.leading)
            make.trailing.equalTo(self.snp.trailing)
        }
        
        backImageView.snp.makeConstraints { (make) in
            make.top.equalTo(headerContentView.snp.top)
            make.leading.equalTo(headerContentView.snp.leading)
            make.trailing.equalTo(headerContentView.snp.trailing)
            make.height.equalTo(250)
        }
        backImageViewScrim.snp.makeConstraints { (make) in
            make.top.equalTo(backImageView.snp.top)
            make.leading.equalTo(backImageView.snp.leading)
            make.trailing.equalTo(backImageView.snp.trailing)
            make.bottom.equalTo(backImageView.snp.bottom)
        }
        mypageButton.snp.makeConstraints { (make) in
            make.top.equalTo(backImageView.snp.top).inset(56)
            make.trailing.equalTo(backImageView.snp.trailing).inset(12)
            make.height.equalTo(20)
            make.width.equalTo(32)
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
            make.leading.equalTo(self.snp.leading).inset(16)
            make.trailing.equalTo(self.snp.trailing).inset(16)
            make.height.equalTo(38)
        }

        popularMeetingLabel.snp.makeConstraints { (make) in
            make.top.equalTo(backImageView.snp.bottom).inset(-52)
            make.leading.equalTo(self.snp.leading).inset(16)
            make.trailing.equalTo(self.snp.trailing)
        }
        popularMeetingColletionView.snp.makeConstraints { (make) in
            make.top.equalTo(popularMeetingLabel.snp.bottom).inset(-11)
            make.leading.equalTo(self.snp.leading)
            make.trailing.equalTo(self.snp.trailing)
            make.width.equalTo(self.frame.width)
            make.height.equalTo(170)
        }
        newMeetingLabel.snp.makeConstraints { (make) in
            make.top.equalTo(popularMeetingColletionView.snp.bottom).inset(-25)
            make.leading.equalTo(self.snp.leading).inset(16)
            make.trailing.equalTo(self.snp.trailing)
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



