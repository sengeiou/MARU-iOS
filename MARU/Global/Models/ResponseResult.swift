//
//  Models.swift
//  MARU
//
//  Created by 오준현 on 2020/08/14.
//  Copyright © 2020 maru. All rights reserved.
//

import Foundation

struct ResponseResult<T: Codable>: Codable {
    var status: Int?
    var success: Bool?
    var message: String?
    var data: [T]?
}

struct ResponseSimpleResult<T: Codable>: Codable {
    var status: Int?
    var success: Bool?
    var message: String?
    var data: T?
}

struct ResponseTempResult: Codable {
    var status: Int?
    var success: Bool?
    var message: String?
}
