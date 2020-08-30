//
//  SearchResultVC.swift
//  MARU
//
//  Created by 이윤진 on 2020/08/16.
//  Copyright © 2020 maru. All rights reserved.
//

import UIKit
import CoreData
import SwiftKeychainWrapper

class SearchResultVC: UIViewController{
    // identifier: searchResultTVCell
    var bookTitle:[String] = ["운다고 달라지는 일은 아무것도 없겠지만","운다고 달라지는 일은 아무것도 없겠지만","운다고 달라지는 일은 아무것도 없겠지만"]
    var searchResult: String?
    var recodeObject: [NSManagedObject] = []
    let con = (UIApplication.shared.delegate as! AppDelegate).persistentContainer.viewContext
    @IBOutlet weak var SearchResultTV: UITableView!
    @IBOutlet weak var searchTextField: UITextField!
 
    
    override func viewDidLoad(){
        
        let nibName = UINib(nibName: "SearchResultTVCell", bundle: nil)
        
        SearchResultTV.register(nibName, forCellReuseIdentifier: "SearchResultTVCell")
        SearchResultTV.delegate = self
        SearchResultTV.dataSource = self
        super.viewDidLoad()
        SearchResultTV.separatorStyle = UITableViewCell.SeparatorStyle.none // 테이블뷰 셀 구분선 없애기
    }
    
    @IBAction func searchBtnTouched(_ sender: Any) {
        
        
    }
    
    @IBAction func cancelBtnTouched(_ sender: Any) {
        self.navigationController?.popViewController(animated: true)
    }
    
    func save(_ inputRecode: String) {
        guard let appDelegate = UIApplication.shared.delegate as? AppDelegate else {
            return
        }
        
        // 1
        let managedContext =
            appDelegate.persistentContainer.viewContext
        
        // 2
        let entity =
            NSEntityDescription.entity(forEntityName: "Recode",
                                       in: managedContext)!
        
        let recode = NSManagedObject(entity: entity,
                                     insertInto: managedContext)
        
        // 3
        recode.setValue(inputRecode, forKeyPath: "recode")
        recode.setValue(Date(), forKey: "time")
        
        // 4
        do {
            try managedContext.save()
            recodeObject.append(recode)
        } catch let error as NSError {
            print("Could not save. \(error), \(error.userInfo)")
        }
        
        
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
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath){
        print(indexPath)
        guard let entryMoimVC = self.storyboard?.instantiateViewController(identifier:
        "SearchEntryMoimVC") as? SearchEntryMoimVC else { return }
        self.navigationController?.pushViewController(entryMoimVC, animated: true)
    }
}
