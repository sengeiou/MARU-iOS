//
//  SearchResultVC.swift
//  MARU
//
//  Created by 이윤진 on 2020/08/16.
//  Copyright © 2020 maru. All rights reserved.
//

import UIKit

class SearchResultVC: UIViewController{
    // identifier: searchResultTVCell
    var bookTitle:[String] = ["운다고 달라지는 일은 아무것도 없겠지만","운다고 달라지는 일은 아무것도 없겠지만","운다고 달라지는 일은 아무것도 없겠지만"]
   //let cellSpacingHeight: CGFloat = 18
    @IBOutlet weak var SearchResultTV: UITableView!
    
    override func viewDidLoad(){
        
        let nibName = UINib(nibName: "SearchResultTVCell", bundle: nil)
        
        SearchResultTV.register(nibName, forCellReuseIdentifier: "SearchResultTVCell")
        SearchResultTV.delegate = self
        SearchResultTV.dataSource = self
        super.viewDidLoad()
        SearchResultTV.separatorStyle = UITableViewCell.SeparatorStyle.none // 테이블뷰 셀 구분선 없애기
    }
    
}

extension SearchResultVC: UITableViewDelegate, UITableViewDataSource {
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return self.bookTitle.count
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        //return cellSpacingHeight
        let cellSpacingHeight: CGFloat
        switch section {
        case 0:
            // hide the header
            cellSpacingHeight = CGFloat.leastNonzeroMagnitude
        default:
            cellSpacingHeight = 21
        }

        return cellSpacingHeight
    }
    
    func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        let headerView = UIView()
        headerView.backgroundColor = UIColor.clear
        return headerView
    }
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "SearchResultTVCell", for: indexPath) as! SearchResultTVCell
        cell.searchBookName.text = bookTitle[indexPath.row]
        cell.searchBookImage.image = UIImage(named:"it8UKXxG2I8Evo3R6IDeNMx4W")
        cell.backgroundView = UIImageView(image: UIImage(named: "listBackGround"))
        cell.backgroundView?.contentMode = UIView.ContentMode.scaleAspectFill
        return cell
    }
    
}
