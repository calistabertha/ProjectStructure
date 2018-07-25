//
//  Constants.swift
//  ProjectStructure
//
//  Created by Digital Khrisna on 6/16/17.
//  Copyright © 2017 codigo. All rights reserved.
//

import Foundation

enum BuildType {
    case development
    case stagging
    case production
}

struct Config {
    static let appKey = "a5120ae232de05c4b3b54a1a8a8bfd17"
    
    /*
     *  Define URL of REST API
     */
    static let developmentBaseAPI = "https://api.themoviedb.org/3/"
    static let staggingBaseAPI = "https://api.themoviedb.org/3/"
    static let productionBaseAPI = "https://api.themoviedb.org/3/"
    
    /*
     *  Define base URL of picture
     */
    static let basePictureAPI = "https://image.tmdb.org/t/p/w500"
}

struct REST {
    struct Movie {
        static let popular = "movie/popular"
        static let topRated = "movie/top_rated"
    }
}
