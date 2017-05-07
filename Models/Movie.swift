//
//  Movie.swift
//  iMovie
//
//  Created by XuanChien on 2/1/17.
//  Copyright © 2017 XuanChien. All rights reserved.
//

import Foundation
import SwiftyJSON

struct Movie: BaseModel {
    
    
    var adult = false
    var backdropPath = String.empty
    var posterPath = String.empty
    var overview = String.empty
    var releaseDate = String.empty
    var id = Int.zero
    var originalTitle = String.empty
    var originalLanguage = String.empty
    var title = String.empty
    var popularity = Double.zero
    var video = false
    var voteCount = Int.zero
    var voteAverage = Double.zero
    //    var belongsToCollection
    var budget = Int.zero
    var genres: [Genre] = []
    var homepage = String.empty
    var imdbID = String.empty
    //    var productionCompanies
    //    var productionCountries
    var revenue = Int.zero
    var runtime = Int.zero
    //    var spokenLanguages
    var status = String.empty
    var tagline = String.empty
    
    init(json: JSON) {
        
        adult = json["adult"].boolValue
        backdropPath = json["backdrop_path"].stringValue
        posterPath = json["poster_path"].stringValue
        overview = json["overview"].stringValue
        releaseDate = json["release_date"].stringValue
        id = json["id"].intValue
        originalTitle = json["original_title"].stringValue
        originalLanguage = json["original_language"].stringValue
        title = json["title"].stringValue
        popularity = json["popularity"].doubleValue
        video = json["video"].boolValue
        voteCount = json["vote_count"].intValue
        voteAverage = json["vote_average"].doubleValue
        
        budget = json["budget"].intValue
        
        let jsonDatas = json["genres"].arrayValue
        for jsonData in jsonDatas {
            let genre = Genre(json: jsonData)
            genres.append(genre)
        }
        
        homepage = json["homepage"].stringValue
        imdbID = json["imdb_id"].stringValue
        
        
        revenue = json["revenue"].intValue
        runtime = json["runtime"].intValue
        
        status = json ["status"].stringValue
        tagline = json["tagline"].stringValue
        
    }
    
}
