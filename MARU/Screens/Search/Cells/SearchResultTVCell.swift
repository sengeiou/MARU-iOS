//
//  SearchResultTVCell.swift
//  MARU
//
//  Created by 이윤진 on 2020/08/18.
//  Copyright © 2020 maru. All rights reserved.
//

import UIKit

class SearchResultTVCell: UITableViewCell {

//    let shadowView = UIView().then {
//        $0.backgroundColor = .white
//    }
   
    
    @IBOutlet weak var searchBookImage: UIImageView! // 책 이미지
    @IBOutlet weak var searchBookName: UILabel! // 책 제목
    @IBOutlet weak var searchBookAuthor: UILabel! // 책 저자
    @IBOutlet weak var searchMoimZang: UILabel! // 방장 이름
    @IBOutlet weak var searchMoimValidate: UILabel! // 유효기간 날짜 수(Int)
    @IBOutlet weak var searchMoimIntro: UILabel! // 소개 문구
    
    var searchedMoimResult: SearchMoimResult?
    var roomIdx: Int?
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code

    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

    func setCell(){
        
        searchBookImage.imageFromUrl(searchedMoimResult?.thumbnail ?? "", defaultImgPath: "")
        searchBookName.text = searchedMoimResult?.title
        searchBookAuthor.text = searchedMoimResult?.authors
        searchMoimZang.text = searchedMoimResult?.nickName
        searchMoimIntro.text = searchedMoimResult?.info
        roomIdx = searchedMoimResult?.roomIdx
//        let originPostTime = searchedMoimResult?.createdAt
//        let postTimeDateFormat = originPostTime?.getDateFormat(time: originPostTime!)
//        searchMoimValidate.text = postTimeDateFormat?.timeAgoSince(postTimeDateFormat!)
    }
}
