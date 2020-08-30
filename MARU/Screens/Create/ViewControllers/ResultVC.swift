//
//  ResultVC.swift
//  MARU
//
//  Created by 이윤진 on 2020/08/24.
//  Copyright © 2020 maru. All rights reserved.
//

import UIKit
import CoreData

class ResultVC: UIViewController {
    
    @IBOutlet weak var resultTV: UITableView!
    @IBOutlet weak var searchTextField: UITextField!
    
    private var searchedBookResult: SearchBookResult?
    
    var searchResult: String?
    var recodeObject: [NSManagedObject] = []
    let con = (UIApplication.shared.delegate as! AppDelegate).persistentContainer.viewContext
    
    override func viewDidLoad() {
        super.viewDidLoad()

            let nibName = UINib(nibName: "ResultTVCell", bundle: nil)
            resultTV.register(nibName, forCellReuseIdentifier: "ResultTVCell")
            resultTV.delegate = self
            resultTV.dataSource = self
            super.viewDidLoad()
            resultTV.separatorStyle = UITableViewCell.SeparatorStyle.none // 테이블뷰 셀 구분선 없애기
        }
    
    @IBAction func searchBtnTouched(_ sender: Any) {
        
        searchProduct(searchTextField.text ?? "")
        save(searchTextField.text ?? "")
    }
    
    @IBAction func cancelBtnTouched(_ sender: Any) {
        self.navigationController?.popViewController(animated: true)
        
    }
    func save(_ inputRecode: String){
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

extension ResultVC: UITableViewDataSource,UITableViewDelegate{
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return searchedBookResult?.data.count ?? 0
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
//        cell.resultBookTitle.text = bookTitle[indexPath.row]
//        cell.resultBookImageView.image = UIImage(named: "6A81B61199A158032Cd5A2D7Cd66E264")
        cell.backgroundView = UIImageView(image: UIImage(named: "listBackGround"))
        cell.backgroundView?.contentMode = UIView.ContentMode.scaleAspectFill
        cell.searchedBookResult = searchedBookResult
        cell.setCell(num: indexPath.row)
        return cell
    }
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath){
        print(indexPath)
        guard let createMoimVC = self.storyboard?.instantiateViewController(identifier:
            "CreateVC") as? CreateVC else { return }
        self.navigationController?.pushViewController(createMoimVC, animated: true)
    }
    
    @objc func searchProduct(_ result: String){
        
        SearchBookService.shared.searchBook(result){ (responseData) in switch responseData{
        case.success(let res) :
            let response = res as! SearchBookResult
            self.searchedBookResult = response
            print(self.searchedBookResult)
            DispatchQueue.main.async{
                self.resultTV.reloadData()
            }
            self.resultTV.reloadData() // pageindex 값 바꾸기
//            self.pageIndex[0] = self.pageIndex[1] + 1
//            self.pageIndex[1] = self.pageIndex[1] + 10
        case.requestErr(_):
            print("requestErr")
        case .pathErr:
            print("pathErr")
            print("??")
        case .serverErr:
            print("serverErr")
        case .networkFail:
            print("networkFail")
            }
            
            
        }
    }
    
}
