//
//  Video.swift
//  iMovie
//
//  Created by XuanChien on 2/1/17.
//  Copyright © 2017 XuanChien. All rights reserved.
//

import Foundation
import SwiftyJSON

struct Video: BaseModel {
    
    var id = String.empty
    var key = String.empty
    var name = String.empty
    var site = String.empty
    var size = Int.zero
    var type = String.empty

    init() {}
    
    init(json: JSON) {
        id = json["id"].stringValue
        key = json["key"].stringValue
        name = json["name"].stringValue
        site = json["site"].stringValue
        size = json["size"].intValue
        type = json["type"].stringValue
    }
    
}
