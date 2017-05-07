//
//  Genre.swift
//  iMovie
//
//  Created by XuanChien on 2/1/17.
//  Copyright © 2017 XuanChien. All rights reserved.
//

import Foundation
import SwiftyJSON

struct Genre: BaseModel {
    
    var id = String.empty
    var name = String.empty

    init() {}

    init(json: JSON) {
        
        id = json["id"].stringValue
        name = json["name"].stringValue
        
    }
    
}
