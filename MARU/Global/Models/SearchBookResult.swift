//
//  SearchBookResult.swift
//  MARU
//
//  Created by 이윤진 on 2020/08/28.
//  Copyright © 2020 maru. All rights reserved.
//

import Foundation

// MARK: - SearchBookResult
struct SearchBookResult: Codable {
    let status: Int
    let success: Bool
    let data: [BookInfo]
}

// MARK: - Datum
struct BookInfo: Codable {
    let authors, title: String
    let thumbnail: String // 책 표지 이미지
}
