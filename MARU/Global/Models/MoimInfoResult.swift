//
//  MoimInfoResult.swift
//  MARU
//
//  Created by 이윤진 on 2020/09/02.
//  Copyright © 2020 maru. All rights reserved.
//

import Foundation

struct MoimInfoResult: Codable{
    
    let thumbnail: String
    let title, authors, createdAt, info: String
    let nickName: String
    let avgRating: String
    let peopleCount: Int
    
    init(from decoder: Decoder) throws {
        let values = try decoder.container(keyedBy: CodingKeys.self)
        thumbnail = (try? values.decode(String.self, forKey: .thumbnail)) ?? ""
        title = (try? values.decode(String.self, forKey: .title)) ?? ""
        authors = (try? values.decode(String.self, forKey: .authors)) ?? ""
        createdAt = (try? values.decode(String.self, forKey: .createdAt)) ?? ""
        info = (try? values.decode(String.self, forKey: .info)) ?? ""
        nickName = (try? values.decode(String.self, forKey: .nickName)) ?? ""
        avgRating = (try? values.decode(String.self, forKey: .avgRating)) ?? ""
        peopleCount = (try? values.decode(Int.self, forKey: .peopleCount)) ?? 0
        
    }
}
