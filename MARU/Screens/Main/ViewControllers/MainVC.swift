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

class MainVC: UIViewController {
    
    
    //MARK: - UI Components ( CollectionView )
    
    let popularMeetingColletionView: UICollectionView = {
        let layout = UICollectionViewFlowLayout()
        layout.scrollDirection = .horizontal
        
        let cv = UICollectionView(frame: .zero, collectionViewLayout: layout)
        cv.translatesAutoresizingMaskIntoConstraints = false
        cv.register(PopularMeetingCVC.self, forCellWithReuseIdentifier: "PopularMeetingCVC")
        
        cv.backgroundColor = . white
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
    let bookLogoImageView = UIImageView().then {
        $0.image = UIImage(named: "bookImgWhite")
    }
    let commentLabel = UILabel().then {
        $0.numberOfLines = 2
        $0.font = UIFont.systemFont(ofSize: 20, weight: UIFont.Weight.bold)
        $0.textColor = .white
        $0.text = "사람들과 함께\n책장을 넘겨보세요."
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
    let shadowView = UIView()
    
    //MARK: - viewDidLoad
    override func viewDidLoad() {
        super.viewDidLoad()
        layout()
    }
}
extension MainVC: UICollectionViewDelegateFlowLayout {
    
    //MARK: - CellCize
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        
        switch collectionView {
            
        case self.popularMeetingColletionView:
            return CGSize(width: self.view.frame.width * (81/375), height: (collectionView.frame.height))
            
        case self.newMeetingCollectionView:
            return CGSize(width: self.view.frame.width * (343/375) , height: self.view.frame.height * (110/812))
        default:
            return CGSize(width: 0, height: 0)
        }
    }
    
    //MARK: - CollectionView ContentView Inset
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, insetForSectionAt section: Int) -> UIEdgeInsets {
        
        switch collectionView {
        case self.popularMeetingColletionView:
            return UIEdgeInsets(top: 0, left: 16, bottom: 0, right: 278)
            
        case self.newMeetingCollectionView:
            return UIEdgeInsets(top: 3, left: 16, bottom: 3, right: 16)
        default:
            return UIEdgeInsets()
        }
        
    }
    
    //MARK: - distance between Cells
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumInteritemSpacingForSectionAt section: Int) -> CGFloat {
        return 15
  
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        return 23
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

