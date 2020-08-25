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
    
    //    var currentPage : Int = 0
    
    fileprivate var currentPage: Int = 0
    
    fileprivate var pageSize: CGSize {
        let layout = self.moimCollectionView?.collectionViewLayout as! UpCarouselFlowLayout
        var pageSize = layout.itemSize
        pageSize.width += layout.minimumLineSpacing
        return pageSize
    }
    
    
    @IBOutlet weak var moimCollectionView: UICollectionView!
    @IBOutlet weak var paging: CHIPageControlFresno!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        pageControlSize()
        
        addCollectionView()
        
        //                moimCollectionView.isPagingEnabled = true
        self.moimCollectionView?.showsHorizontalScrollIndicator = false
        
        self.moimCollectionView?.delegate = self
        self.moimCollectionView?.dataSource = self
        
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
        
        self.currentPage = 0
    }
    
    // MARK: - 여기가 문제다 !!!!!!
    func addCollectionView(){
        
        let layout = UpCarouselFlowLayout()
        
        layout.itemSize = CGSize(width: 292, height: 270)
        
        layout.scrollDirection = .horizontal
        
        
        //MARK: - 아래 코드를 살리면 collectionview가 안보임.
        //        self.moimCollectionView = UICollectionView(frame: .zero, collectionViewLayout: layout)
        
        // 위의 코드를 아래와 같이 변환
        self.moimCollectionView.collectionViewLayout = layout
        
        self.moimCollectionView?.translatesAutoresizingMaskIntoConstraints = false
        
        
        let spacingLayout = self.moimCollectionView?.collectionViewLayout as! UpCarouselFlowLayout
        
        spacingLayout.spacingMode = UPCarouselFlowLayoutSpacingMode.overlap(visibleOffset: 20)
        
    }
    
    class RelativeLayoutUtilityClass {
        
        var heightFrame: CGFloat?
        var widthFrame: CGFloat?
        
        init(referenceFrameSize: CGSize){
            heightFrame = referenceFrameSize.height
            widthFrame = referenceFrameSize.width
        }
        
        func relativeHeight(multiplier: CGFloat) -> CGFloat{
            
            return multiplier * self.heightFrame!
        }
        
        func relativeWidth(multiplier: CGFloat) -> CGFloat{
            return multiplier * self.widthFrame!
            
        }
    }
    
}

extension MoimVC: UIScrollViewDelegate {
    
    
    func scrollViewDidScroll(_ scrollView: UIScrollView) {
        
        //        let scrollPage = moimCollectionView.contentOffset.x / view.frame.width
        //        currentPage = Int(scrollPage)
        //        self.paging.set(progress: currentPage, animated: true)
        //
        
        //MARK: - 사이즈 문제 , 오토 문제 해결
        let layout = self.moimCollectionView?.collectionViewLayout as! UpCarouselFlowLayout
        let pageSide = (layout.scrollDirection == .horizontal) ? self.pageSize.width : self.pageSize.height
        let offset = (layout.scrollDirection == .horizontal) ? scrollView.contentOffset.x : scrollView.contentOffset.y
        currentPage = Int(floor((offset - pageSide / 2) / pageSide) + 1)
        
        self.paging.set(progress: currentPage, animated: true)
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

