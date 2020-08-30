//
//  SearchBookService.swift
//  MARU
//
//  Created by 이윤진 on 2020/08/28.
//  Copyright © 2020 maru. All rights reserved.
//

import Foundation
import Alamofire

// MARK:- 토론 생성 위한 책 검색  // GET 책 검색 - 토론방 개설 목적 search/book?title=책제목
//static let searchBook = BaseURL + "search/book"
struct SearchBookService {

    private init(){}
    static let shared = SearchBookService()
    
    func searchBook(_ title: String,
                    completion: @escaping(NetworkResult<Any>)->Void){
        
        let URL = APIConstants.searchBook + "?title=" + title
        let headers: HTTPHeaders = [
            "Content-Type": "application/json"
        ]
        Alamofire.request(URL,
                          method: .get,
                          parameters: nil,
                          encoding: JSONEncoding.default,
                          headers: headers).responseData{
            response in

            switch response.result {
                
            case .success:
                // parameter 위치
                if let value = response.result.value {
                    if let status = response.response?.statusCode {
                        print(status)
                        switch status {
                        case 200:
                            do{
                                let decoder = JSONDecoder()
                                let result = try decoder.decode(ResponseResult<SearchBookResult>.self,
                                                                from: value)
                                completion(.success(result.data ?? [SearchBookResult].self))
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
