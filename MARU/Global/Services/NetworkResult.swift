//
//  NetworkResult.swift
//  MARU
//
//  Created by psychehose on 2020/08/28.
//  Copyright © 2020 maru. All rights reserved.
//

enum NetworkResult<T> {
    case success(T)
    case requestErr(T)
    case pathErr
    case serverErr
    case networkFail
    
}
