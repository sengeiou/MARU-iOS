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
    
    let loginButton = UIButton().then {
        $0.setTitle("로그인 하세요", for: .normal)
        $0.titleLabel?.font = UIFont.systemFont(ofSize: 30, weight: .bold)
        $0.setTitleColor(.veryLightPink, for: .normal)
        $0.addTarget(self, action: #selector(didTapCloseButton), for: .touchUpInside)
    }
    
    let loginSecondButton = UIButton().then {
        $0.setTitle("""
                    책을 읽고 다양한 사람들과
                    이야기 해보세요.
                    """, for: .normal)
        $0.titleLabel?.font = UIFont.systemFont(ofSize: 18, weight: .bold)
        $0.titleLabel?.numberOfLines = 0
        $0.setTitleColor(.veryLightPink, for: .normal)
        $0.addTarget(self, action: #selector(didTapCloseButton), for: .touchUpInside)
    }

    var data: Profile?
    var rootVC: UIViewController?
    
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
        
        nameLabel.text = data?.nickName
        
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
        
        ratingLabel.text = data?.avgRating.description
        
    }
    
    func toLoginView(){
        addSubview(closeButton)
        addSubview(loginButton)
        addSubview(loginSecondButton)

        closeButton.snp.makeConstraints { (make) in
            make.top.equalToSuperview().offset(14)
            make.leading.equalToSuperview().offset(17)
            make.width.equalTo(16)
            make.height.equalTo(16)
        }
        
        loginButton.snp.makeConstraints { (make) in
            make.top.equalToSuperview().offset(60)
            make.leading.equalToSuperview().offset(16)
            make.width.equalTo(162)
            make.height.equalTo(35)
        }
        
        loginSecondButton.snp.makeConstraints { (make) in
            make.top.equalToSuperview().offset(111)
            make.leading.equalToSuperview().offset(16)
            make.width.equalTo(184)
            make.height.equalTo(46)
        }

    }
    
    @objc func didTapCloseButton() {
        rootVC?.dismiss(animated: true)
    }
}
