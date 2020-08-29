//
//  MainLists.swift
//  MARU
//
//  Created by psychehose on 2020/08/29.
//  Copyright © 2020 maru. All rights reserved.
//

import Foundation

//// MARK: - Welcome
//struct MainLists: Codable {
//    let status: Int
//    let success: Bool
//    let message: String
//    let data: DataClass
//}

// MARK: - DataClass
struct MainLists: Codable {
    let maxRoomList: [MaxRoomList]
    let newRoomList: [NewRoomList]
}

// MARK: - MaxRoomList
struct MaxRoomList: Codable {
    let thumbnail, authors, title: String
    let roomCount: Int
}

// MARK: - NewRoomList
struct NewRoomList: Codable {
    let thumbnail, authors, title, info: String
    let nickName: String
}
