//
//  HeaderVC.swift
//  MARU
//
//  Created by psychehose on 2020/08/25.
//  Copyright © 2020 maru. All rights reserved.
//

import UIKit

class HeaderVC: UICollectionReusableView {
    
    
    
    let headerContentView = UIView().then {
        $0.backgroundColor = .white
    }
    
    let popularMeetingColletionView: UICollectionView = {
        let layout = UICollectionViewFlowLayout()
        layout.scrollDirection = .horizontal
        
        let cv = UICollectionView(frame: .zero, collectionViewLayout: layout)
        cv.translatesAutoresizingMaskIntoConstraints = false
        cv.register(PopularMeetingCVC.self, forCellWithReuseIdentifier: "PopularMeetingCVC")
        cv.showsHorizontalScrollIndicator = false
        cv.backgroundColor = .white
        return cv
    }()
    
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
        $0.font = UIFont.systemFont(ofSize: 18, weight: UIFont.Weight.bold)
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
    
    
    override init(frame: CGRect){
        super.init(frame: frame)
        self.headerLayout()
        
        
    }
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }
    
}

extension HeaderVC: UICollectionViewDelegateFlowLayout {
    

    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        
        return CGSize(width: 81, height: 170)
    }
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, insetForSectionAt section: Int) -> UIEdgeInsets {
        
        return UIEdgeInsets(top: 0, left: 16, bottom: 0, right: 0)
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        return 15
    }
    
}

extension HeaderVC: UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 30
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        guard let popularCell = collectionView.dequeueReusableCell(withReuseIdentifier: "PopularMeetingCVC", for: indexPath) as? PopularMeetingCVC else { return UICollectionViewCell()}
        popularCell.backgroundColor = .white
        return popularCell
    }
    
}
