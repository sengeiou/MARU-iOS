//
//  EntryMoimInfoService.swift
//  MARU
//
//  Created by 이윤진 on 2020/09/02.
//  Copyright © 2020 maru. All rights reserved.
//

import Foundation
import Alamofire


// MARK: - // GET 토론방 소개 room/roomInfo/:roomIdx , static let IntroMoim = BaseURL + "room/roomInfo/"
struct EntryMoimInfoService{
    
    private init(){}
    static let shared = EntryMoimInfoService()
    
    func entryMoimInfoService(_ roomIdx: Int, completion: @escaping(NetworkResult<Any>)->
        Void){
        
        let URL = APIConstants.IntroMoim + "\(roomIdx)"
        print("주소: \(URL)")
        let headers: HTTPHeaders = [
            "Content-Type": "application/json"
        ]
        Alamofire.request(URL,method: .get,parameters: nil,encoding: JSONEncoding.default ,headers: headers).responseData{
            response in
            dump(response.result)
            
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
                                let result = try decoder.decode(ResponseResult<MoimInfoResult>.self,from: value)
                                
                                completion(.success(result.data ?? [MoimInfoResult].self))
                                dump(result)
                            } catch {
                                completion(.pathErr)
                            }
                        case 400:
                            do{
                                let decoder = JSONDecoder()
                                let result = try decoder.decode(MoimInfoResult.self,
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
