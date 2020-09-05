//
//  CreateQuizService.swift
//  MARU
//
//  Created by 이윤진 on 2020/09/02.
//  Copyright © 2020 maru. All rights reserved.
//

import Foundation
import Alamofire
import SwiftKeychainWrapper
// MARK: - 퀴즈 생성 // // POST 토론방 개설 makeMoim = BaseURL + "room/make"
struct CreateQuizService{
    private init(){}
    static let shared = CreateQuizService()
    
    var thumbnail: String?
    
    func createQuiz(_ thumbnail: String,
                    _ authors: String,
                    _ title: String,
                    _ info: String,
                    _ quiz1: String,
                    _ quiz2: String,
                    _ quiz3: String,
                    _ quiz4: String,
                    _ quiz5: String,
                    _ answer1: String,
                    _ answer2: String,
                    _ answer3: String,
                    _ answer4: String,
                    _ answer5: String,
                    completion: @escaping (NetworkResult<Any>) -> Void ){
        
        let URL = APIConstants.makeMoim
        let token = KeychainWrapper.standard.string(forKey: Keychain.token.rawValue) ?? ""
        let headers: HTTPHeaders = [
            "Content-Type": "application/json",
            "token" : token
        ]
        print(URL)
        let body : Parameters = [
            "thumbnail": thumbnail,
            "authors": authors,
            "title": title,
            "info": info,
            "quiz1": quiz1,
            "quiz2": quiz2,
            "quiz3": quiz3,
            "quiz4": quiz4,
            "quiz5": quiz5,
            "anwswer1": answer1,
            "answer2": answer2,
            "answer3": answer3,
            "answer4": answer4,
            "answer5": answer5
        ]
        
        Alamofire.request(URL,
                          method: .post,
                          parameters: body,
                          encoding: JSONEncoding.default,
                          headers: headers).responseData
            {
                
                response in
                print(response.result)
                dump(response)
                
                switch response.result {
                case .success:
                    // parameter 위치
                    if let value = response.result.value {
                        if let status = response.response?.statusCode {
                            print("상태", status)
                            switch status {
                            case 200:
                                do{
                                    let decoder = JSONDecoder()
                                    let result = try decoder.decode(ResponseResult<MoimIndexResult>.self,
                                                                    from: value)
                                    dump(result)
                                    completion(.success(result))
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
