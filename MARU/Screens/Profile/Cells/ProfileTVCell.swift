//
//  ProfileTVCell.swift
//  MARU
//
//  Created by 오준현 on 2020/08/29.
//  Copyright © 2020 maru. All rights reserved.
//

import UIKit

class ProfileTVCell: UITableViewCell {

    let identifier = "ProfileTVCell"
    
    let underLineView = UIView().then {
        $0.backgroundColor = .brownishGrey
        $0.alpha = 0.1
    }
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

    func setCell(){
        contentView.addSubview(underLineView)
        
        underLineView.snp.makeConstraints { (make) in
            make.height.equalTo(1)
            make.bottom.equalTo(contentView.snp.bottom)
            make.leading.equalTo(contentView).offset(16)
            make.trailing.equalTo(contentView).inset(16)
        }
    }
    
}
