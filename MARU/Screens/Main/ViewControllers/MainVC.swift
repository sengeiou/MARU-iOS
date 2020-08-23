//
//  ViewController.swift
//  MARU
//
//  Created by 오준현 on 2020/08/14.
//  Copyright © 2020 maru. All rights reserved.
//

import UIKit

import Then
import SnapKit

class MainVC: UIViewController, UITextFieldDelegate {
    
    
    //MARK: - UI Components ( CollectionView )
    
    let popularMeetingColletionView: UICollectionView = {
        let layout = UICollectionViewFlowLayout()
        layout.scrollDirection = .horizontal
        
        let cv = UICollectionView(frame: .zero, collectionViewLayout: layout)
        cv.translatesAutoresizingMaskIntoConstraints = false
        cv.register(PopularMeetingCVC.self, forCellWithReuseIdentifier: "PopularMeetingCVC")
        
        cv.backgroundColor = . red
        cv.showsHorizontalScrollIndicator = false
        return cv
    }()
    
    let newMeetingCollectionView: UICollectionView = {
        let layout = UICollectionViewFlowLayout()
        layout.scrollDirection = .vertical
        
        
        let cv = UICollectionView(frame: .zero, collectionViewLayout: layout)
        cv.backgroundColor = .white
        cv.translatesAutoresizingMaskIntoConstraints = false
        cv.register(NewMeetingCVC.self, forCellWithReuseIdentifier: "NewMeetingCVC")
        return cv
    }()
    
    //MARK: - UI Components ( About BackImgView )
    
    let backImageView = UIImageView().then {
        $0.image = UIImage(named: "picture")
    }
    
    let backImageViewScrim = UIView().then {
        $0.backgroundColor = UIColor.black2
        $0.alpha = 0.5
    }
    let bookLogoImageView = UIImageView().then {
        $0.image = UIImage(named: "bookImgWhite")
    }
    let commentLabel = UILabel().then {
        $0.numberOfLines = 2
        $0.font = UIFont.systemFont(ofSize: 20, weight: UIFont.Weight.bold)
        $0.textColor = .white
        $0.text = "사람들과 함께\n책장을 넘겨보세요."
    }
    
    let searchLabel = UIView().then {
        $0.backgroundColor = .white
        $0.layer.borderWidth = 1
        $0.layer.cornerRadius = 10
        $0.layer.borderColor = UIColor(red: 0.9, green: 0.9, blue: 0.9, alpha: 1.0).cgColor
        $0.layer.masksToBounds = true
        $0.layer.shadowColor = UIColor.black.cgColor

        $0.layer.shadowOffset = .zero
        $0.layer.shadowRadius = 1.5
        $0.layer.shadowOpacity = 0.28
        $0.layer.shadowOffset = CGSize(width: 0.5, height: 0.5)
    }
    
    let searchImage = UIImageView().then {
        $0.image = UIImage(named: "search")
    }
    let searchTextField = UITextField().then {
        $0.text = ""
        $0.placeholder  = "책 제목을 입력해주세요."
        $0.tintColor = .black
        $0.textAlignment = .left
        $0.font = UIFont.systemFont(ofSize: 13, weight: UIFont.Weight.bold)
    }
    
    let mypageButton = UILabel().then {
        $0.font = UIFont.systemFont(ofSize: 12, weight: UIFont.Weight.bold)
        $0.textColor = .white
        $0.text = "MY"
    }
    let popularMeetingLabel = UILabel().then {
        $0.font = UIFont.systemFont(ofSize: 18, weight: UIFont.Weight.bold)
        $0.text = "지금 가장 모임이 많은 책은?"
    }
    let newMeetingLabel = UILabel().then {
        $0.font = UIFont.systemFont(ofSize: 18, weight: UIFont.Weight.bold)
        $0.text = "지금 새로 나온 모임"
    }
    
    let contentView = UIView()
    
    //MARK: - viewDidLoad
    override func viewDidLoad() {
        super.viewDidLoad()
        searchTextField.delegate = self
        layout()
        keyboardNotification()
        
    }
}
extension MainVC: UICollectionViewDelegateFlowLayout {
    
    //MARK: - CellCize
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        
        switch collectionView {
            
        case self.popularMeetingColletionView:
            return CGSize(width: 81, height: 170)
            
        case self.newMeetingCollectionView:
            return CGSize(width: self.view.frame.width * (343/375) , height: 110)
        default:
            return CGSize(width: 0, height: 0)
        }
    }
    //MARK: - CollectionView ContentView Inset
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, insetForSectionAt section: Int) -> UIEdgeInsets {
        
        switch collectionView {
        case self.popularMeetingColletionView:
            return UIEdgeInsets(top: 0, left: 16, bottom: 0, right: 0)
            
        case self.newMeetingCollectionView:
            return UIEdgeInsets(top: 0, left: 16, bottom: 0, right: 16)
        default:
            return UIEdgeInsets()
        }
    }
    //MARK: - distance between Cells
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumInteritemSpacingForSectionAt section: Int) -> CGFloat {
        return 23
    }
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        return 15
    }
}

extension MainVC: UICollectionViewDataSource {
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 10
    }
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        switch collectionView {
        case self.popularMeetingColletionView:
            guard let popularCell = collectionView.dequeueReusableCell(withReuseIdentifier: "PopularMeetingCVC", for: indexPath) as? PopularMeetingCVC else { return UICollectionViewCell()}
            return popularCell
            
        case self.newMeetingCollectionView:
            guard let newMeetingCell = collectionView.dequeueReusableCell(withReuseIdentifier: "NewMeetingCVC", for: indexPath) as? NewMeetingCVC else { return UICollectionViewCell()}
            return newMeetingCell
            
        default:
            return UICollectionViewCell()
        }
    }
    
}

    //MARK: - Keyboard setting

extension MainVC {
    
    
    //MARK: - Keyboard에 대한 알림 받으면 행동
    
    func keyboardNotification() {
        NotificationCenter.default.addObserver(self, selector: #selector(keyboardWillShow(_:)), name: UIResponder.keyboardWillShowNotification, object: nil)
        
        NotificationCenter.default.addObserver(self, selector: #selector(keyboardWillHide(_:)), name: UIResponder.keyboardWillHideNotification, object: nil)
    }
    
    @objc func keyboardWillShow(_ sender: Notification) {
        }
    @objc func keyboardWillHide(_ sender: Notification) {
    }
    
    //MARK: - Keyboard 내려감에 관한 함수
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        textField.resignFirstResponder()
        return true
    }
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        self.view.endEditing(true)
    }
    
}


