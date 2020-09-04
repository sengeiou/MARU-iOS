//
//  ChatService.swift
//  MARU
//
//  Created by 오준현 on 2020/09/04.
//  Copyright © 2020 maru. All rights reserved.
//

import Alamofire

struct ChatService {
    private init() {}
    
    static let shared = ChatService()
    
    func messages(_ roomIndex: String,
                  completion: @escaping (NetworkResult<Any>) -> Void) {
        
        let URL = APIConstants.chat + roomIndex
        print(URL)
        let headers: HTTPHeaders = [
            "Content-Type": "application/json"
        ]
                
        Alamofire.request(URL,
                          method: .get,
                          parameters: nil,
                          encoding: JSONEncoding.default,
                          headers: headers).responseData
            { response in
                
                switch response.result {
                    
                case .success:
                    // parameter 위치
                    if let value = response.result.value {
                        //response의 respones안에 있는 statusCode를 추출
                        if let status = response.response?.statusCode {
                            switch status {
                            case 200:
                                do{
                                    let decoder = JSONDecoder()
                                    let result = try decoder.decode(ResponseResult<Chat>.self,
                                                                    from: value)
                                    
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
                                print("실패 500")
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

struct Chat: Codable {
    let nickName, msg, chatTime: String
    let roomIdx: Int
}
