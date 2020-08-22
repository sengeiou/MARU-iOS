//
//  PopularMeetingCVC.swift
//  MARU
//
//  Created by psychehose on 2020/08/20.
//  Copyright © 2020 maru. All rights reserved.
//

import UIKit

class PopularMeetingCVC: UICollectionViewCell {
    
    //MARK: - UIComponent - CollectionView
    let bookImg = UIImageView().then {
        $0.image = UIImage(named: "da70C3E762C8960615Ba191579B0C1B8")
    }
    let bookTitle = UILabel().then {
        $0.font = UIFont.systemFont(ofSize: 13, weight: UIFont.Weight.bold)
        $0.text = "아몬드"
    }
    let bookAuthor = UILabel().then {
        $0.font = UIFont.systemFont(ofSize: 10, weight: UIFont.Weight.light)
        $0.text = "손원평"
    }
    
    //MARK: - Override Init
    
    override init(frame: CGRect){
        super.init(frame: frame)
        self.addSubview(bookImg)
        self.addSubview(bookTitle)
        self.addSubview(bookAuthor)
        
        bookImg.snp.makeConstraints { (make) in
            make.top.equalTo(contentView.snp.top).inset(0)
            make.leading.equalTo(contentView.snp.leading).inset(0)
            make.trailing.equalTo(contentView.snp.trailing).inset(0)
            make.height.equalTo(130)
            
        }
        bookTitle.snp.makeConstraints { (make) in
            make.top.equalTo(bookImg.snp.bottom).inset(-11)
            make.leading.equalTo(contentView.snp.leading).inset(0)
            make.height.equalTo(13)
        }
        bookAuthor.snp.makeConstraints{ (make) in
            make.top.equalTo(bookTitle.snp.bottom).inset(-5)
            make.leading.equalTo(contentView.snp.leading).inset(0)
            make.height.equalTo(5)
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
