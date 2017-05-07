//
//  Person.swift
//  iMovie
//
//  Created by XuanChien on 2/1/17.
//  Copyright © 2017 XuanChien. All rights reserved.
//

import Foundation
import SwiftyJSON

struct Person {
    
    var adult = false
    //    var alsoKnownAs
    var biography = String.empty
    var birthday = String.empty
    var deathday = String.empty
    var gender = Int.zero
    var homepage = String.empty
    var id = Int.zero
    var imdbID = String.empty
    var name = String.empty
    var placeOfBirth = String.empty
    var popularity = Double.zero
    var profilePath = String.empty
    
    init(json: JSON) {
        
        adult = json["adult"].boolValue
        biography = json["biography"].stringValue
        birthday = json["birthday"].stringValue
        deathday = json["deathday"].stringValue
        gender = json["gender"].intValue
        homepage = json["homepage"].stringValue
        id = json["id"].intValue
        imdbID = json["imdb_id"].stringValue
        name = json["name"].stringValue
        placeOfBirth = json["place_of_birth"].stringValue
        popularity = json["popularity"].doubleValue
        profilePath = json["profile_path"].stringValue
        
    }
    
}
