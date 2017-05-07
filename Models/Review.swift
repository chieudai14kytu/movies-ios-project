//
//  Review.swift
//  iMovie
//
//  Created by XuanChien on 2/1/17.
//  Copyright © 2017 XuanChien. All rights reserved.
//

import Foundation
import SwiftyJSON

struct Review: BaseModel {
    
    var id = String.empty
    var author = String.empty
    var content = String.empty
    var url = String.empty

    init() {}
    
    init(json: JSON) {
        id = json["id"].stringValue
        author = json["author"].stringValue
        content = json["content"].stringValue
        url = json["url"].stringValue
    }
    
}
