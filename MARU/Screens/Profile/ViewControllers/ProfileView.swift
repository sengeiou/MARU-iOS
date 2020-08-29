//
//  ProfileView.swift
//  MARU
//
//  Created by 오준현 on 2020/08/29.
//  Copyright © 2020 maru. All rights reserved.
//

import UIKit

import Then
import SnapKit

class ProfileView: UIView {

    let closeButton = UIButton().then {
        $0.setImage(UIImage(named: "deleteIcon"), for: .normal)
        $0.addTarget(self, action: #selector(didTapCloseButton), for: .touchUpInside)
    }
    
    let nameLabel = UILabel().then {
        $0.text = "준현"
        $0.font = UIFont.systemFont(ofSize: 30, weight: .bold)
    }
    
    let ratingGuideLabel = UILabel().then {
        $0.text = "방장 평점"
        $0.textColor =  .cornflowerBlue
        $0.font = UIFont.systemFont(ofSize: 20, weight: .semibold)
    }
    
    let ratingGuideImage = UIImageView().then {
        $0.image = UIImage(named: "scoreIcon")
    }
    
    let ratingLabel = UILabel().then {
        $0.text = "4.5"
        $0.textColor = .cornflowerBlue
        $0.font = UIFont.systemFont(ofSize: 20, weight: .semibold)
    }
    
    func setView(){
        addSubview(closeButton)
        addSubview(nameLabel)
        addSubview(ratingGuideLabel)
        addSubview(ratingGuideImage)
        addSubview(ratingLabel)

        closeButton.snp.makeConstraints { (make) in
            make.top.equalToSuperview().offset(14)
            make.leading.equalToSuperview().offset(17)
            make.width.equalTo(16)
            make.height.equalTo(16)
        }
        
        nameLabel.snp.makeConstraints { (make) in
            make.top.equalToSuperview().offset(63)
            make.leading.equalToSuperview().offset(16)
        }
        
        ratingGuideLabel.snp.makeConstraints { (make) in
            make.top.equalToSuperview().offset(101)
            make.leading.equalToSuperview().offset(16)
        }
        
        ratingGuideImage.snp.makeConstraints { (make) in
            make.top.equalToSuperview().offset(133)
            make.leading.equalToSuperview().offset(16)
            make.width.equalTo(13)
            make.height.equalTo(14.2)
        }
        
        ratingLabel.snp.makeConstraints { (make) in
            make.top.equalToSuperview().offset(129)
            make.leading.equalToSuperview().offset(33)
        }
    }
    
    func toLoginView(){
        
    }
    
    @objc func didTapCloseButton() {
        print(#function)
    }
}
