//
//  Chat+Constraint.swift
//  MARU
//
//  Created by 오준현 on 2020/09/04.
//  Copyright © 2020 maru. All rights reserved.
//

import UIKit

extension ChatVC {
    

    @objc func didTapFirst(){
        rating = 1
        firstRatingButton.setImage(UIImage(named: "starBlue"), for: .normal)
        secondRatingButton.setImage(UIImage(named: "starGray"), for: .normal)
        thirdRatingButton.setImage(UIImage(named: "starGray"), for: .normal)
        fourthRatingButton.setImage(UIImage(named: "starGray"), for: .normal)
        fifthRatingButton.setImage(UIImage(named: "starGray"), for: .normal)
        ratingEndButton.isEnabled = true
        ratingEndButton.backgroundColor = .cornflowerBlue
    }
    @objc func didTapSecond(){
        rating = 2
        firstRatingButton.setImage(UIImage(named: "starBlue"), for: .normal)
        secondRatingButton.setImage(UIImage(named: "starBlue"), for: .normal)
        thirdRatingButton.setImage(UIImage(named: "starGray"), for: .normal)
        fourthRatingButton.setImage(UIImage(named: "starGray"), for: .normal)
        fifthRatingButton.setImage(UIImage(named: "starGray"), for: .normal)
        ratingEndButton.isEnabled = true
        ratingEndButton.backgroundColor = .cornflowerBlue
    }
    @objc func didTapThird(){
        rating = 3
        firstRatingButton.setImage(UIImage(named: "starBlue"), for: .normal)
        secondRatingButton.setImage(UIImage(named: "starBlue"), for: .normal)
        thirdRatingButton.setImage(UIImage(named: "starBlue"), for: .normal)
        fourthRatingButton.setImage(UIImage(named: "starGray"), for: .normal)
        fifthRatingButton.setImage(UIImage(named: "starGray"), for: .normal)
        ratingEndButton.isEnabled = true
        ratingEndButton.backgroundColor = .cornflowerBlue
    }
    @objc func didTapFourth(){
        rating = 4
        firstRatingButton.setImage(UIImage(named: "starBlue"), for: .normal)
        secondRatingButton.setImage(UIImage(named: "starBlue"), for: .normal)
        thirdRatingButton.setImage(UIImage(named: "starBlue"), for: .normal)
        fourthRatingButton.setImage(UIImage(named: "starBlue"), for: .normal)
        fifthRatingButton.setImage(UIImage(named: "starGray"), for: .normal)
        ratingEndButton.isEnabled = true
        ratingEndButton.backgroundColor = .cornflowerBlue
    }
    @objc func didTapFifth(){
        rating = 5
        firstRatingButton.setImage(UIImage(named: "starBlue"), for: .normal)
        secondRatingButton.setImage(UIImage(named: "starBlue"), for: .normal)
        thirdRatingButton.setImage(UIImage(named: "starBlue"), for: .normal)
        fourthRatingButton.setImage(UIImage(named: "starBlue"), for: .normal)
        fifthRatingButton.setImage(UIImage(named: "starBlue"), for: .normal)
        ratingEndButton.isEnabled = true
        ratingEndButton.backgroundColor = .cornflowerBlue
    }


    func setPopUpView(){
        blurImageView.bounds = .init(x: 0,
                                     y: 0,
                                     width: view.bounds.width,
                                     height: view.bounds.height)
        
        popupView.bounds = CGRect(x: 0,
                                  y: 0,
                                  width: self.view.bounds.width*0.8,
                                  height: 247)
        
        ratingEndButton.frame = .init(x: 0,
                                      y: 0,
                                      width: popupView.bounds.width,
                                      height: 54)
        
        ratingEndButton.roundedBottom()

        popupView.addSubview(ratingGuideLabel)
        popupView.addSubview(firstRatingButton)
        popupView.addSubview(secondRatingButton)
        popupView.addSubview(thirdRatingButton)
        popupView.addSubview(fourthRatingButton)
        popupView.addSubview(fifthRatingButton)
        popupView.addSubview(ratingNameLabel)
        popupView.addSubview(ratingEndButton)
        
        ratingGuideLabel.snp.makeConstraints { (make) in
            make.top.equalTo(popupView.snp.top).offset(35)
            make.centerX.equalTo(popupView.snp.centerX)
        }
        
        firstRatingButton.snp.makeConstraints { (make) in
            make.top.equalTo(thirdRatingButton.snp.top)
            make.trailing.equalTo(thirdRatingButton.snp.leading).offset(-46)
            make.width.equalTo(26)
            make.height.equalTo(26)
        }
        
        secondRatingButton.snp.makeConstraints { (make) in
            make.top.equalTo(thirdRatingButton.snp.top)
            make.trailing.equalTo(thirdRatingButton.snp.leading).offset(-10)
            make.width.equalTo(26)
            make.height.equalTo(26)
        }
        
        thirdRatingButton.snp.makeConstraints { (make) in
            make.top.equalTo(popupView.snp.top).offset(87)
            make.centerX.equalTo(popupView.snp.centerX)
            make.width.equalTo(26)
            make.height.equalTo(26)
        }
        
        fourthRatingButton.snp.makeConstraints { (make) in
            make.top.equalTo(thirdRatingButton.snp.top)
            make.leading.equalTo(thirdRatingButton.snp.trailing).offset(10)
            make.width.equalTo(26)
            make.height.equalTo(26)
        }
        
        fifthRatingButton.snp.makeConstraints { (make) in
            make.top.equalTo(thirdRatingButton.snp.top)
            make.leading.equalTo(thirdRatingButton.snp.trailing).offset(46)
            make.width.equalTo(26)
            make.height.equalTo(26)
        }
        
        ratingNameLabel.snp.makeConstraints { (make) in
            make.top.equalTo(popupView.snp.top).offset(142)
            make.centerX.equalTo(popupView.snp.centerX)
        }
        
        ratingEndButton.snp.makeConstraints { (make) in
            make.bottom.equalTo(popupView.snp.bottom)
            make.centerX.equalTo(popupView.snp.centerX)
            make.width.equalTo(popupView.snp.width)
            make.height.equalTo(54)
        }
        
        let name = "라노벨 정균"
        let nameString = name + (ratingNameLabel.text ?? "")
        let attrString = NSMutableAttributedString(string: nameString)
        attrString.addAttribute(NSAttributedString.Key(rawValue: kCTFontAttributeName as String),
                                value: UIFont.systemFont(ofSize: 15, weight: .semibold) as Any,
                                range: NSMakeRange(0, name.count))
        ratingNameLabel.attributedText = attrString

        animateScaleIn(desiredView: blurImageView)
        animateScaleIn(desiredView: popupView)
        disable(false)
    }
    
    func disable(_ bool: Bool) {
        chatCollectionView.isScrollEnabled = bool
        noticeDeleteButton.isEnabled = bool
        textField.isEnabled = bool
    }
    
    func animateScaleIn(desiredView: UIView) {
        let backgroundView = self.view!
        backgroundView.addSubview(desiredView)
        desiredView.center = backgroundView.center
        desiredView.isHidden = false
        
        desiredView.transform = CGAffineTransform(scaleX: 1.1, y: 1.1)
        desiredView.alpha = 0
        
        UIView.animate(withDuration: 0.2) {
            desiredView.transform = CGAffineTransform(scaleX: 1.0, y: 1.0)
            desiredView.alpha = 1
        }
    }
    
    func animateScaleOut(desiredView: UIView) {
        UIView.animate(withDuration: 0.2, animations: {
            desiredView.transform = CGAffineTransform(scaleX: 1.1, y: 1.1)
            desiredView.alpha = 0
        }, completion: { (success: Bool) in
            desiredView.removeFromSuperview()
        })
        
        UIView.animate(withDuration: 0.2, animations: {
            
        }, completion: { _ in
            
        })
    }

    func constraint() {
        view.addSubview(textFieldView)
        view.addSubview(outTextFieldView)
        view.addSubview(textField)
        view.addSubview(sendButton)
        view.addSubview(chatCollectionView)
        view.addSubview(noticeView)
        view.addSubview(noticeLabel)
        view.addSubview(noticeDeleteButton)
        
        textFieldView.snp.makeConstraints { (make) in
            make.bottom.equalTo(view.safeAreaLayoutGuide.snp.bottom)
            make.leading.equalToSuperview()
            make.trailing.equalToSuperview()
            make.height.equalTo(46)
        }
        
        outTextFieldView.snp.makeConstraints { (make) in
            make.leading.equalTo(textFieldView.snp.leading).offset(10)
            make.trailing.equalTo(textFieldView.snp.trailing).offset(-10)
            make.bottom.equalTo(textFieldView.snp.bottom).inset(4)
            make.top.equalTo(textFieldView.snp.top).offset(4)
        }

        textField.snp.makeConstraints { (make) in
            make.leading.equalTo(outTextFieldView.snp.leading).offset(10)
            make.trailing.equalTo(sendButton.snp.leading).offset(-5)
            make.bottom.equalTo(outTextFieldView.snp.bottom).inset(3)
            make.top.equalTo(outTextFieldView.snp.top).offset(3)
        }
        
        sendButton.snp.makeConstraints { (make) in
            make.trailing.equalTo(outTextFieldView.snp.trailing).inset(5)
            make.top.equalTo(outTextFieldView.snp.top).offset(5)
            make.width.equalTo(30)
            make.height.equalTo(30)
        }
        
        chatCollectionView.snp.makeConstraints { (make) in
            make.top.equalTo(view.safeAreaLayoutGuide.snp.top)
            make.leading.equalToSuperview()
            make.trailing.equalToSuperview()
            make.bottom.equalTo(textFieldView.snp.top)
        }
        
        
    }
    
    func constraintNotice(){
        noticeView.snp.makeConstraints { (make) in
            make.top.equalTo(chatCollectionView.snp.top)
            make.leading.equalToSuperview()
            make.trailing.equalToSuperview()
            make.height.equalTo(60)
        }
        
        noticeLabel.snp.makeConstraints { (make) in
            make.top.equalTo(chatCollectionView.snp.top).offset(12)
            make.leading.equalToSuperview().offset(16)
            make.trailing.equalToSuperview().offset(-32)
            make.height.equalTo(36)
        }
        
        noticeDeleteButton.snp.makeConstraints { (make) in
            make.top.equalTo(chatCollectionView.snp.top).offset(9)
            make.trailing.equalToSuperview().offset(-16)
            make.height.equalTo(10)
            make.width.equalTo(10)
        }

    }

}
