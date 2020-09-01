//
//  ResultTVCell.swift
//  MARU
//
//  Created by 이윤진 on 2020/08/24.
//  Copyright © 2020 maru. All rights reserved.
//

import UIKit

class ResultTVCell: UITableViewCell {

    @IBOutlet weak var resultBookImageView: UIImageView!
    @IBOutlet weak var resultBookAuthor: UILabel!
    @IBOutlet weak var resultBookTitle: UILabel!
    var searchedBookResult: SearchBookResult?
    //var searchedBookInfo: BookInfo?
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    func setCell(){

        resultBookImageView.imageFromUrl(searchedBookResult?.thumbnail ?? "", defaultImgPath: "")
        resultBookTitle.text = searchedBookResult?.title
       
        resultBookAuthor.text = searchedBookResult?.authors
    }
    
}
