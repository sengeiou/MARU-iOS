//
//  MainNewMeetingService.swift
//  MARU
//
//  Created by psychehose on 2020/08/29.
//  Copyright © 2020 maru. All rights reserved.
//

import Foundation

import Foundation

import Alamofire


struct MainNewMeetingService {
    private init() {}
    
    static let shared = MainNewMeetingService()
    
    func getNewMeeting(completion: @escaping (NetworkResult<Any>) -> Void) {
        
        let URL = APIConstants.main
        let headers: HTTPHeaders = ["Content-Type": "application/json",
        ]
        
        Alamofire.request(URL, method: .get, parameters: nil, encoding: JSONEncoding.default, headers: headers).responseData {
            response in
            
            switch response.result {
            case .success:
                if let value = response.result.value {
                    if let status = response.response?.statusCode {
                        switch status {
                        case 200:
                            do {
                                let decoder = JSONDecoder()
                                let result = try
                                    decoder.decode(ResponseSimpleResult<MainLists>.self, from: value)
                                completion(.success(result.data ?? MainLists.self))
                            }catch {
                                completion(.pathErr)
                            }
                        case 409:
                            completion(.pathErr)
                        case 500:
                            completion(.serverErr)
                        default:
                            break
                        }
                    }
                }
                break
            case .failure(let err):
                print(err.localizedDescription)
                completion(.networkFail)
                
            }
            
        }
        
    }
    
}

//3개 아래이면 count 이고, //3개 이상이다.그러면 3개 하고 new data로 넣어주기 5개씩
