//
//  APIURL.swift
//  WatherAppDemo
//
//  Created by Navdip Kotadiya on 08/08/22.
//

import UIKit

enum APIURL: String {
    #if DEBUG
    case baseURL = "https://api.openweathermap.org"
    #else
    case baseURL = "https://api.openweathermap.org"
    #endif

    var convertedURL: URL {
        guard let url = URL(string: rawValue) else {
            assertionFailure("Incorrect format of URL")
            return URL(string: "")!
        }
        
        return url
    }
}
