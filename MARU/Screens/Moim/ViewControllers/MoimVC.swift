//
//  MoimVC.swift
//  MARU
//
//  Created by 오준현 on 2020/08/14.
//  Copyright © 2020 maru. All rights reserved.
//

import CHIPageControl
import UIKit

class MoimVC: UIViewController {
    
    @IBOutlet weak var moimCollectionView: UICollectionView!
    @IBOutlet weak var paging: CHIPageControlFresno!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        moimCollectionView.delegate = self
        moimCollectionView.dataSource = self
        
        pageControlSize()
    }
    
    
    func pageControlSize() {
        paging.numberOfPages = 3
        paging.radius = 4
        paging.tintColor = UIColor(red: 194, green: 194, blue: 194)
        paging.currentPageTintColor = UIColor(red: 194, green: 194, blue: 194)
        paging.padding = 6
//        paging.insertTintColor(UIColor(red: 194, green: 194, blue: 194), position: 2)

    }
    
}

extension MoimVC: UICollectionViewDelegate{
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        
    }
}

extension MoimVC: UICollectionViewDataSource {
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        
        return 3
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "MoimCVCell", for: indexPath) as!
        MoimCVCell
        
        cell.viewShadow()
        
        
        return cell
        
    }
    
}

extension MoimVC:UICollectionViewDelegateFlowLayout {
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt
        indexPath: IndexPath) -> CGSize {
        
        return CGSize(width: (collectionView.frame.width), height: (collectionView.frame.height))
        
    }
}
