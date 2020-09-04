//
//  SearchMoimService.swift
//  MARU
//
//  Created by 이윤진 on 2020/09/02.
//  Copyright © 2020 maru. All rights reserved.
//

import Foundation
import Alamofire
import SwiftKeychainWrapper
// MARK:- 토론 검색  // GET 책 검색 - 토론방 개설 목적 search/book?title=책제목
//static let searchBook = BaseURL + "search/room"
struct SearchMoimService {

    private init(){}
    static let shared = SearchMoimService()
    
    func searchMoim(_ title: String,
                    completion: @escaping(NetworkResult<Any>)->Void){
        
        guard let title = title.stringByAddingPercentEncodingForFormData() else { return }
        let URL = APIConstants.searchMoim + "?title=" + title
        let token = KeychainWrapper.standard.string(forKey: Keychain.token.rawValue) ?? ""
        let headers: HTTPHeaders = [
            "Content-Type": "application/json",
            "token": token
        ]
        print(URL)
        print(token)
        
        Alamofire.request(URL,
                          method: .get,
                          parameters: nil,
                          encoding: URLEncoding.queryString,
                          headers: headers).responseData{
            response in

            switch response.result {
                
            case .success:
                // parameter 위치
                if let value = response.result.value {
                    if let status = response.response?.statusCode {
                        print("상태",status)
                        switch status {
                        case 200:
                            do{
                                let decoder = JSONDecoder()
                                let result = try decoder.decode(ResponseResult<SearchMoimResult>.self,
                                                                from: value)
                                
                                completion(.success(result.data ?? [SearchMoimResult].self))
                                dump(result)
                            } catch {
                                completion(.pathErr)
                            }
                        case 400:
                            do{
                                let decoder = JSONDecoder()
                                let result = try decoder.decode(ResponseTempResult.self,
                                                                from: value)
                                completion(.requestErr(result))
                            } catch {
                                completion(.pathErr)
                            }
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
