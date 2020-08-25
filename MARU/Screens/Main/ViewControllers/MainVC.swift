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
    
    
    //MARK: - UI Components
    
    let newMeetingCollectionView: UICollectionView = {
        let layout = UICollectionViewFlowLayout()
        layout.scrollDirection = .vertical
        layout.sectionInset  = .zero
        layout.sectionInsetReference = .fromContentInset
        
        
        let cv = UICollectionView(frame: .zero, collectionViewLayout: layout)
        cv.backgroundColor = .white
        cv.translatesAutoresizingMaskIntoConstraints = false
        
        cv.register(NewMeetingCVC.self, forCellWithReuseIdentifier: "NewMeetingCVC")
        cv.register(HeaderVC.self, forSupplementaryViewOfKind: UICollectionView.elementKindSectionHeader, withReuseIdentifier:"HeaderVC")
        return cv
    }()
    
        let contentView = UIView()
    
    //MARK: - viewDidLoad
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        layout()
    }
    //MARK: - Method
    
}
extension MainVC: UICollectionViewDelegateFlowLayout {
    
    
    
    
    //MARK: - Header View Size
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, referenceSizeForHeaderInSection section: Int) -> CGSize {
        
        return CGSize(width: collectionView.frame.width, height: self.view.frame.height * (0.689))
    }

    
    //MARK: - CellCize
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        
        return CGSize(width: self.view.frame.width * (343/375) , height: 110)
    }
    //MARK: - CollectionView ContentView Inset
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, insetForSectionAt section: Int) -> UIEdgeInsets {
        
        return UIEdgeInsets(top: 0, left: 16, bottom: 0, right: 16)
        
    }
    
    
    
    
    //MARK: - distance between Cells
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumInteritemSpacingForSectionAt section: Int) -> CGFloat {
        
        return 23
    }
}

extension MainVC: UICollectionViewDataSource {
    
    
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        return 1
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 10
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        guard let newMeetingCell = collectionView.dequeueReusableCell(withReuseIdentifier: "NewMeetingCVC", for: indexPath) as? NewMeetingCVC else { return UICollectionViewCell()}
        return newMeetingCell
    }
    
    //MARK: - HeaderView reusable
    
    func collectionView(_ collectionView: UICollectionView, viewForSupplementaryElementOfKind kind: String, at indexPath: IndexPath) ->
        UICollectionReusableView {
            switch kind {
            case UICollectionView.elementKindSectionHeader:
                let headerView = collectionView.dequeueReusableSupplementaryView(ofKind: kind, withReuseIdentifier: "HeaderVC", for: indexPath) as? HeaderVC
                return headerView ?? UICollectionReusableView()
            default:
                assert(false, "false")
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


