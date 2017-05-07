//
//  Cast.swift
//  iMovie
//
//  Created by XuanChien on 2/1/17.
//  Copyright © 2017 XuanChien. All rights reserved.
//

import Foundation
import SwiftyJSON

struct Cast: BaseModel {
    
    var id = Int.zero
    var castID = String.empty
    var character = String.empty
    var name = String.empty
    var profilePath = String.empty

    init() {}

    init(json: JSON) {
        
        id = json["id"].intValue
        castID = json["cast_id"].stringValue
        character = json["character"].stringValue
        name = json["name"].stringValue
        profilePath = json["profile_path"].stringValue
        
    }
    
}
