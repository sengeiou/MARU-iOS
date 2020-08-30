//
//  UserService.swift
//  MARU
//
//  Created by 오준현 on 2020/08/30.
//  Copyright © 2020 maru. All rights reserved.
//

import Foundation

import Alamofire
import SwiftKeychainWrapper

struct UserService {
    
    private init() {}
    
    static let shared = UserService()
    
    func signIn(_ id: String, _ password: String,
                completion: @escaping (NetworkResult<Any>) -> Void) {
        
        let URL = APIConstants.signIn
        let headers: HTTPHeaders = [
            "Content-Type": "application/json"
        ]
        
        let body: Parameters = [
            "id": id,
            "password": password
        ]
        
        Alamofire.request(URL,
                          method: .post,
                          parameters: body,
                          encoding: JSONEncoding.default,
                          headers: headers).responseData {
                            response in
                            
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
                                                let result = try decoder.decode(ResponseSimpleResult<Token>.self,
                                                                                from: value)
                                                
                                                KeychainWrapper.standard.set(result.data?.accessToken ?? "",
                                                                             forKey: Keychian.token.rawValue)
                                                
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
    
    func checkID(_ id: String, completion: @escaping (NetworkResult<Any>) -> Void) {
        
        let URL = APIConstants.checkID
        let headers: HTTPHeaders = [
            "Content-Type": "application/json"
        ]
        
        let body: Parameters = [
            "id": id
        ]
        
        Alamofire.request(URL,
                          method: .post,
                          parameters: body,
                          encoding: JSONEncoding.default,
                          headers: headers).responseData {
                            response in
                            
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
                                                let result = try decoder.decode(ResponseTempResult.self,
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
    
    
    func checkNick(_ name: String, completion: @escaping (NetworkResult<Any>) -> Void) {
        
        let URL = APIConstants.checkNick
        let headers: HTTPHeaders = [
            "Content-Type": "application/json"
        ]
        
        let body: Parameters = [
            "nickName": name
        ]
        
        Alamofire.request(URL,
                          method: .post,
                          parameters: body,
                          encoding: JSONEncoding.default,
                          headers: headers).responseData {
                            response in
                            
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
                                                let result = try decoder.decode(ResponseTempResult.self,
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
    
    
    func signUp(_ id: String, _ password: String, _ name: String,
                completion: @escaping (NetworkResult<Any>) -> Void) {
        
        let URL = APIConstants.signUp
        let headers: HTTPHeaders = [
            "Content-Type": "application/json"
        ]
        
        let body: Parameters = [
            "id": id,
            "password": password,
            "nickName": name,
            "rating": "",
            "count": ""
        ]
        
        Alamofire.request(URL,
                          method: .post,
                          parameters: body,
                          encoding: JSONEncoding.default,
                          headers: headers).responseData { response in
                            
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
                                                let result = try decoder.decode(ResponseSimpleResult<Token>.self,
                                                                                from: value)
                                                
                                                KeychainWrapper.standard.set(result.data?.accessToken ?? "",
                                                                             forKey: Keychian.token.rawValue)
                                                
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


struct Token: Codable {
    var accessToken: String
}
