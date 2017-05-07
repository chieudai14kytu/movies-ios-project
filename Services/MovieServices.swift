//
//  MovieServices.swift
//  iMovie
//
//  Created by XuanChien on 2/1/17.
//  Copyright © 2017 XuanChien. All rights reserved.
//

import Foundation
import Alamofire
import SwiftyJSON

typealias MoviesCompletionHandler = (Result<[Movie]>) -> Void
typealias FailureCompletionHandler = (_ error: Error) -> Void
typealias CastsCompletionHandler = (Result<[Cast]>) -> Void
typealias ReviewsCompletionHandler = (Result<[Review]>) -> Void
typealias VideosCompletionHandler = (Result<[Video]>) -> Void

enum ErrorType {
    case one
    case two
}

enum Result<T> {
    case success(T)
    case failure(Error)
}

class MovieServices {

    static let shared = MovieServices()

    func getDetails(movieID id: Int,
                          language: String = String.empty,
                          appendToResponse: String = String.empty,
                          completion: @escaping MoviesCompletionHandler) {
        let params: [String: Any] = [
            Strings.APIKey: Keys.APIKey,
            Strings.Language: language,
            Strings.AppendToResponse: appendToResponse
        ]
        let url = "\(APIs.Movie)/\(id)"
        Alamofire.request(url,
                          method: .get,
                          parameters: params,
                          encoding: URLEncoding.default,
                          headers: nil)
            .responseJSON { response in
                switch response.result {
                case .success(let value):
                    var movies: [Movie] = []
                    let json = JSON(value)
                    let movie = Movie(json: json)
                    movies.append(movie)
                    let result = Result.success(movies)
                    completion(result)
                case .failure(let error):
                    completion(Result.failure(error))
                }
        }
    }

    func getCasts(movieID id: Int, completion: @escaping CastsCompletionHandler) {
        let params: [String: Any] = [
            Strings.APIKey: Keys.APIKey,
            Strings.MovieID: id,
            ]
        let url = "\(APIs.Movie)/\(id)/\(Strings.Credits)"
        Alamofire.request(url,
                          method: .get,
                          parameters: params,
                          encoding: URLEncoding.default,
                          headers: nil)
            .responseJSON { response in
                switch response.result {
                case .success(let value):
                    var casts: [Cast] = []
                    let jsonValue = JSON(value)
                    let jsonResults = jsonValue[Strings.Cast]
                    for json in jsonResults.arrayValue {
                        let cast = Cast(json: json)
                        casts.append(cast)
                    }
                    let result = Result.success(casts)
                    completion(result)
                case .failure(let error):
                    completion(Result.failure(error))
                }
        }
    }

    func getVideos(movieID id: Int,
                         language: String = String.empty,
                         completion: @escaping VideosCompletionHandler) {
        let params: [String: Any] = [
            Strings.APIKey: Keys.APIKey,
            Strings.Language: language,
            Strings.MovieID: id,
            ]
        let url = "\(APIs.Movie)/\(id)/\(Strings.Videos)"
        Alamofire.request(url,
                          method: .get,
                          parameters: params,
                          encoding: URLEncoding.default,
                          headers: nil)
            .responseJSON { response in
                switch response.result {
                case .success(let value):
                    var videos: [Video] = []
                    let jsonValue = JSON(value)
                    let jsonResults = jsonValue[Strings.Results]
                    for json in jsonResults.arrayValue {
                        let video = Video(json: json)
                        videos.append(video)
                    }
                    let result = Result.success(videos)
                    completion(result)
                case .failure(let error):
                    completion(Result.failure(error))
                }
        }
    }

    func getReviews(movieID id: Int,
                          page: Int = 1,
                          completion: @escaping ReviewsCompletionHandler) {
        let params: [String: Any] = [
            Strings.APIKey: Keys.APIKey,
            Strings.Page: "\(page)",
            Strings.MovieID: id,
            ]
        let url = "\(APIs.Movie)/\(id)/\(Strings.Reviews)"
        Alamofire.request(url,
                          method: .get,
                          parameters: params,
                          encoding: URLEncoding.default,
                          headers: nil)
            .responseJSON { response in
                switch response.result {
                case .success(let value):
                    var reviews: [Review] = []
                    let jsonValue = JSON(value)
                    let jsonResults = jsonValue[Strings.Results]
                    for json in jsonResults.arrayValue {
                        let review = Review(json: json)
                        reviews.append(review)
                    }
                    let result = Result.success(reviews)
                    completion(result)
                case .failure(let error):
                    completion(Result.failure(error))
                }
        }

    }

    func getPopular(page: Int = 1,
                          language: String = String.empty,
                          region: String = String.empty,
                          completion: @escaping MoviesCompletionHandler) {
        let params: [String: Any] = [
            Strings.APIKey: Keys.APIKey,
            Strings.Page: "\(page)",
            Strings.Language: language,
            Strings.Region: region
        ]
        Alamofire.request(APIs.GetPopularMovies,
                          method: .get,
                          parameters: params,
                          encoding: URLEncoding.default,
                          headers: nil)
            .responseJSON { response in
                switch response.result {
                case .success(let value):
                    var movies: [Movie] = []
                    let jsonValue = JSON(value)
                    let jsonResults = jsonValue[Strings.Results]
                    for json in jsonResults.arrayValue {
                        let movie = Movie(json: json)
                        movies.append(movie)
                    }
                    let result = Result.success(movies)
                    completion(result)
                case .failure(let error):
                    completion(Result.failure(error))
                }
        }
    }

    func getTopRated(page: Int = 1,
                           language: String = String.empty,
                           region: String = String.empty,
                           completion: @escaping MoviesCompletionHandler) {
        let params: [String: Any] = [
            Strings.APIKey: Keys.APIKey,
            Strings.Page: "\(page)",
            Strings.Language: language,
            Strings.Region: region
        ]
        Alamofire.request(APIs.GetTopRatedMovies,
                          method: .get,
                          parameters: params,
                          encoding: URLEncoding.default,
                          headers: nil)
            .responseJSON { response in
                switch response.result {
                case .success(let value):
                    var movies: [Movie] = []
                    let jsonValue = JSON(value)
                    let jsonResults = jsonValue[Strings.Results]
                    for json in jsonResults.arrayValue {
                        let movie = Movie(json: json)
                        movies.append(movie)
                    }
                    let result = Result.success(movies)
                    completion(result)
                case .failure(let error):
                    completion(Result.failure(error))
                }
        }
    }

    func getUpComing(page: Int = 1,
                           language: String = String.empty,
                           region: String = String.empty,
                           completion: @escaping MoviesCompletionHandler) {
        let params: [String: Any] = [
            Strings.APIKey: Keys.APIKey,
            Strings.Page: "\(page)",
            Strings.Language: language,
            Strings.Region: region
        ]
        Alamofire.request(APIs.GetUpComingMovies,
                          method: .get,
                          parameters: params,
                          encoding: URLEncoding.default,
                          headers: nil)
            .responseJSON { response in
                switch response.result {
                case .success(let value):
                    var movies: [Movie] = []
                    let jsonValue = JSON(value)
                    let jsonResults = jsonValue[Strings.Results]
                    for json in jsonResults.arrayValue {
                        let movie = Movie(json: json)
                        movies.append(movie)
                    }
                    let result = Result.success(movies)
                    completion(result)
                case .failure(let error):
                    completion(Result.failure(error))
                }
        }
    }

    func getLatest(page: Int = 1,
                         language: String = String.empty,
                         region: String = String.empty,
                         completion: @escaping MoviesCompletionHandler) {
        let params: [String: Any] = [
            Strings.APIKey: Keys.APIKey,
            Strings.Page: "\(page)",
            Strings.Language: language,
            Strings.Region: region
        ]
        Alamofire.request(APIs.GetLatestMovies,
                          method: .get,
                          parameters: params,
                          encoding: URLEncoding.default,
                          headers: nil)
            .responseJSON { response in
                switch response.result {
                case .success(let value):
                    var movies: [Movie] = []
                    let jsonValue = JSON(value)
                    let jsonResults = jsonValue[Strings.Results]
                    for json in jsonResults.arrayValue {
                        let movie = Movie(json: json)
                        movies.append(movie)
                    }
                    let result = Result.success(movies)
                    completion(result)
                case .failure(let error):
                    completion(Result.failure(error))
                }
        }
    }

    func getNowPlaying(page: Int = 1,
                             language: String = String.empty,
                             region: String = String.empty,
                             completion: @escaping MoviesCompletionHandler) {
        let params: [String: Any] = [
            Strings.APIKey: Keys.APIKey,
            Strings.Page: "\(page)",
            Strings.Language: language,
            Strings.Region: region
        ]
        Alamofire.request(APIs.GetNowPlayingMovies,
                          method: .get,
                          parameters: params,
                          encoding: URLEncoding.default,
                          headers: nil)
            .responseJSON { response in
                switch response.result {
                case .success(let value):
                    var movies: [Movie] = []
                    let jsonValue = JSON(value)
                    let jsonResults = jsonValue[Strings.Results]
                    for json in jsonResults.arrayValue {
                        let movie = Movie(json: json)
                        movies.append(movie)
                    }
                    let result = Result.success(movies)
                    completion(result)
                case .failure(let error):
                    completion(Result.failure(error))
                }
        }
    }

    func getSimilar(movieID id: Int,
                          page: Int = 1,
                          language: String = String.empty,
                          region: String = String.empty,
                          completion: @escaping MoviesCompletionHandler) {
        let params: [String: Any] = [
            Strings.APIKey: Keys.APIKey,
            Strings.Page: "\(page)",
            Strings.Language: language,
            Strings.MovieID: id
        ]
        let url = "\(APIs.Movie)/\(id)/\(Strings.Similar)"
        Alamofire.request(url,
                          method: .get,
                          parameters: params,
                          encoding: URLEncoding.default,
                          headers: nil)
            .responseJSON { response in
                switch response.result {
                case .success(let value):
                    var movies: [Movie] = []
                    let jsonValue = JSON(value)
                    let jsonResults = jsonValue[Strings.Results]
                    for json in jsonResults.arrayValue {
                        let movie = Movie(json: json)
                        movies.append(movie)
                    }
                    let result = Result.success(movies)
                    completion(result)
                case .failure(let error):
                    completion(Result.failure(error))
                }
        }
    }

    func getRecommendations(movieID id: Int,
                          page: Int = 1,
                          language: String = String.empty,
                          region: String = String.empty,
                          completion: @escaping MoviesCompletionHandler) {
        let params: [String: Any] = [
            Strings.APIKey: Keys.APIKey,
            Strings.Page: "\(page)",
            Strings.Language: language,
            Strings.MovieID: id
        ]
        let url = "\(APIs.Movie)/\(id)/\(Strings.Recommendation)"
        Alamofire.request(url,
                          method: .get,
                          parameters: params,
                          encoding: URLEncoding.default,
                          headers: nil)
            .responseJSON { response in
                switch response.result {
                case .success(let value):
                    var movies: [Movie] = []
                    let jsonValue = JSON(value)
                    let jsonResults = jsonValue[Strings.Results]
                    for json in jsonResults.arrayValue {
                        let movie = Movie(json: json)
                        movies.append(movie)
                    }
                    let result = Result.success(movies)
                    completion(result)
                case .failure(let error):
                    completion(Result.failure(error))
                }
        }
    }

}
