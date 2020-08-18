//
//  SearchNavVC.swift
//  MARU
//
//  Created by 이윤진 on 2020/08/17.
//  Copyright © 2020 maru. All rights reserved.
//

// MARK: - Navigation Controller connect

import UIKit

class SearchNavVC: UINavigationController {
    
     override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        navigationController?.setNavigationBarHidden(true, animated: animated)
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        navigationController?.setNavigationBarHidden(false, animated: animated)
    }
    
}

