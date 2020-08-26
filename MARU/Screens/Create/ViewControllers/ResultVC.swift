//
//  ResultVC.swift
//  MARU
//
//  Created by 이윤진 on 2020/08/24.
//  Copyright © 2020 maru. All rights reserved.
//

import UIKit

class ResultVC: UIViewController{
    var bookTitle:[String] = ["머리부터 발끝까지 사랑해"]
    @IBOutlet weak var resultTV: UITableView!
    override func viewDidLoad() {
        super.viewDidLoad()

            let nibName = UINib(nibName: "ResultTVCell", bundle: nil)
            resultTV.register(nibName, forCellReuseIdentifier: "ResultTVCell")
            resultTV.delegate = self
            resultTV.dataSource = self
            super.viewDidLoad()
            resultTV.separatorStyle = UITableViewCell.SeparatorStyle.none // 테이블뷰 셀 구분선 없애기
        }
    }

extension ResultVC: UITableViewDataSource,UITableViewDelegate{
    
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
        let cell = tableView.dequeueReusableCell(withIdentifier: "ResultTVCell", for: indexPath) as! ResultTVCell
        cell.resultBookTitle.text = bookTitle[indexPath.row]
        cell.resultBookImageView.image = UIImage(named: "6A81B61199A158032Cd5A2D7Cd66E264")
        cell.backgroundView = UIImageView(image: UIImage(named: "listBackGround"))
        cell.backgroundView?.contentMode = UIView.ContentMode.scaleAspectFill
        return cell
    }
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath){
        print(indexPath)
        guard let createMoimVC = self.storyboard?.instantiateViewController(identifier:
            "CreateVC") as? CreateVC else { return }
        self.navigationController?.pushViewController(createMoimVC, animated: true)
    }
    
}
