//
//  Crew.swift
//  iMovie
//
//  Created by XuanChien on 2/1/17.
//  Copyright © 2017 XuanChien. All rights reserved.
//

import Foundation
import SwiftyJSON

struct Crew: BaseModel {
    
    var creditID = String.empty
    var id = Int.zero
    var department = String.empty
    var name = String.empty
    var job = String.empty
    var profilePath = String.empty
    
    init(json: JSON) {
        
        id = json["id"].intValue
        creditID = json["credit_id"].stringValue
        department = json["department"].stringValue
        name = json["name"].stringValue
        job = json["job"].stringValue
        profilePath = json["profile_path"].stringValue
        
    }
    
}
