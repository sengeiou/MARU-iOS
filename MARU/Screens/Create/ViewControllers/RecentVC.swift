//
//  RecentVC.swift
//  MARU
//
//  Created by 이윤진 on 2020/08/24.
//  Copyright © 2020 maru. All rights reserved.
//

import UIKit

class RecentVC: UIViewController{
    let headerView = UIView()
    let headerLabel = UIButton().then{
        $0.setTitle("최근 검색어", for: .normal)
        $0.setTitleColor(UIColor(red: 65, green: 105, blue: 225), for: .normal)
        $0.titleLabel?.font = UIFont.systemFont(ofSize: 13, weight: .bold)
    }
    let headerDeleteButton = UIButton().then {
        $0.setTitle("전체 삭제", for: .normal)
        $0.setTitleColor(.lightGray, for: .normal)
        $0.titleLabel?.font = UIFont.systemFont(ofSize: 11, weight: .bold)
    }
    @IBOutlet weak var RecentTV: UITableView!
    override func viewDidLoad() {
        let nibName = UINib(nibName: "RecentTVCell", bundle: nil)
        RecentTV.register(nibName, forCellReuseIdentifier: "RecentTVCell")
        RecentTV.delegate = self
        RecentTV.dataSource = self
        RecentTV.separatorStyle = UITableViewCell.SeparatorStyle.none // 테이블뷰 셀 구분선 없애기
        super.viewDidLoad()
    }
    @IBAction func cancelBtnTouched(_ sender: Any) {
        guard let ResultVC = self.storyboard?.instantiateViewController(identifier:
               "ResultVC") as? ResultVC else { return }
               self.navigationController?.pushViewController(ResultVC, animated: true)
        
    }
}

extension RecentVC: UITableViewDelegate,UITableViewDataSource{
    
    func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        
        self.headerView.addSubview(headerDeleteButton)
        self.headerView.addSubview(headerLabel)
        
        headerDeleteButton.snp.makeConstraints { (make) in
            make.trailing.equalTo(headerView.snp.trailing)
            make.top.equalTo(headerView.snp.top).offset(5)
        }
        
        headerLabel.snp.makeConstraints { (make) in
            make.leading.equalTo(headerView.snp.leading)
            make.top.equalTo(headerView.snp.top).offset(5)
        }
        
        //headerDeleteButton.addTarget(self, action: #selector(deleteAllRecords), for: .touchUpInside)
        
        return headerView
    }
    
    
    func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        
        return 30
    }
    
    
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        3
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "RecentTVCell",for: indexPath) as! RecentTVCell
        /*let recoding = recodeMemory[indexPath.row]
        
        cell.traceLabel.text = recoding*/
        cell.recentSearchLabel.text = "검색어 기록"
        let bgColorView = UIView()
        bgColorView.backgroundColor = UIColor.white
        cell.selectedBackgroundView = bgColorView
        return cell
    }
    
    
    
}
