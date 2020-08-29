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
        self.contentView.addSubview(newMeetingCollectionView)
        
        newMeetingCollectionView.delegate = self
        newMeetingCollectionView.dataSource = self
        
        
        
        
        self.newMeetingCollectionView.contentInsetAdjustmentBehavior = .never
        
        contentView.snp.makeConstraints{ ( make ) in
            make.top.equalToSuperview()
            make.bottom.equalTo(self.view.safeAreaLayoutGuide)
            make.leading.equalToSuperview()
            make.right.equalToSuperview()
        }
        
        newMeetingCollectionView.snp.makeConstraints { (make) in
            make.top.equalTo(contentView.snp.top).inset(0)
            make.bottom.equalTo(contentView.snp.bottom).inset(0)
            make.leading.equalTo(contentView.snp.leading).inset(0)
            make.trailing.equalTo(contentView.snp.trailing).inset(0)
        }
    }
}
