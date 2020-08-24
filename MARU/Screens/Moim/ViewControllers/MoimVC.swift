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
    
    var currentPage : Int = 0
   
    @IBOutlet weak var moimCollectionView: UICollectionView!
    @IBOutlet weak var paging: CHIPageControlFresno!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        moimCollectionView.delegate = self
        moimCollectionView.dataSource = self
        
        pageControlSize()
        
        moimCollectionView.isPagingEnabled = true
        moimCollectionView.showsHorizontalScrollIndicator = false
        
        print(currentPage)
        print(paging.currentPage)
    }
    
    func pageControlSize() {
        
        paging.frame = .init(x: 0, y: 0, width: 100, height: 10)
        paging.numberOfPages = 3
        paging.radius = 4
        paging.tintColor = UIColor(red: 194, green: 194, blue: 194)
        paging.currentPageTintColor = UIColor(red: 194, green: 194, blue: 194)
        paging.padding = 6
        //        paging.insertTintColor(UIColor(red: 194, green: 194, blue: 194), position: 2)
        
        //        self.currentPage = 0
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
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        return 0
    }
}

extension MoimVC: UIScrollViewDelegate {
    
    func scrollViewDidScroll(_ scrollView: UIScrollView) {
        
        
        let scrollPage = scrollView.contentOffset.x / view.frame.width
        
        currentPage = Int(scrollPage)
        
        self.paging.set(progress: currentPage, animated: true)
        
    }
    
}


