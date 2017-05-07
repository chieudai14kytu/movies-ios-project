//
//  Constants.swift
//  movie-ios-project
//
//  Created by XuanChien on 4/18/17.
//  Copyright © 2017 XuanChien. All rights reserved.
//

import Foundation

struct CellHeight {
    static let MovieThumbnail = 200
    static let Slider = 200
    static let Container = 150
    static let Default = 44
    static let Minimun = 0.001
    static let ContainerCollectionCell = 200
}

struct Ratio {
    static let MainCollectionViewCell: Double = 210 / 410
}

struct CornerValue {
    static let `default` = 4
}

struct Margin {
    static let `default` = 8
}

struct Strings {
    static let APIKey = "api_key"
    static let Page = "page"
    static let Language = "language"
    static let Region = "region"
    static let Results = "results"
    static let AppendToResponse = "append_to_response"
    static let MovieID = "movie_id"
    static let Cast = "cast"
    static let Credits = "credits"
    static let Reviews = "reviews"
    static let Videos = "videos"
    static let Similar = "similar"
    static let Recommendation = "recommendations"
}

struct Keys {
    static let APIKey = "3b0d22bc8bf870bb4f801814bf3bdb29" // v3auth
    static let APIKeyV4 = "eyJ0eXAiOiJKV1QiLCJhbGciOiJIUzI1NiJ9.eyJhdWQiOiIzYjBkMjJiYzhiZjg3MGJiNGY4MDE4MTRiZjNiZGIyOSIsInN1YiI6IjU3NTNiMjJmOTI1MTQxNWFkYzAwMDU3OSIsInNjb3BlcyI6WyJhcGlfcmVhZCJdLCJ2ZXJzaW9uIjoxfQ.-595C7m2d-BGPDF53poq0s0q9osViAznvFgR4gEracE"
}

struct APIs {
    private static let BaseURL = "https://api.themoviedb.org/3"
    private static let BaseImageURL = "https://image.tmdb.org/t/p/"
    static let YoutubeBaseURL = "https://www.youtube.com/watch?v="
    static let Movie = "\(BaseURL)/movie"
    static let Tv = "\(BaseURL)/tv"
    static let Person = "\(BaseURL)/person"
    static let PosterURL = "\(BaseImageURL)/w780"
    static let BackdropURL = "\(BaseImageURL)/w300"
    static let ProfileURL = "\(BaseImageURL)/w185"
    static let GetNowPlayingMovies = "\(Movie)/now_playing"
    static let GetPopularMovies = "\(Movie)/popular"
    static let GetUpComingMovies = "\(Movie)/upcoming"
    static let GetTopRatedMovies = "\(Movie)/top_rated"
    static let GetLatestMovies = "\(Movie)/latest"
}

struct StoryboardID {
    static let EpisodeListVC = "EpisodeListViewController"
    static let RelatedListVC = "RelatedListViewController"
    static let ReviewListVC = "ReviewListViewController"
    static let CastListVC = "CastListViewController"
    static let CastVC = "CastViewController"
    static let MovieInfoVC = "MovieInfoViewController"
    static let MovieVC = "MovieViewController"
    static let PlayerVC = "PlayerViewController"
}

struct SegueID {
    struct Present {
        static let MovieInfoVC = "PresentMovieInfo"
    }
    struct Show {
        static let MovieVC = "ShowMovie"
        static let MovieInfoVC = "ShowMovieInfo"
        static let EpisodeListVC = "ShowEpisodeList"
        static let CastListVC = "ShowCastList"
        static let CastDetailVC = "ShowCastDetail"
        static let ReviewListVC = "ShowReviewList"
        static let RelatedListVC = "ShowRelatedList"
        static let PlayerVC = "ShowPlayer"
    }
}




















