//
//  WeatherRequest.swift
//  WatherAppDemo
//
//  Created by Navdip Kotadiya on 08/08/22.
//

import UIKit

enum WeatherRequest {
    case weather(_ model: WeatherRequestModel?)
}

extension WeatherRequest: APIRequest {

    var path: APIPath {
        switch self {
        case .weather: return .weather
        }
    }

    var method: HTTPMethod {
        switch self {
        case .weather: return .get
        }
    }
    
    var queryItems: [URLQueryItem]? {
        switch self {
        case let .weather(model):
                return
            [
                URLQueryItem(name: "appid", value: OPEN_WEATHER_KEY),
                URLQueryItem(name: "units", value: "metric"),
                URLQueryItem(name: "lat", value: model?.lat ?? ""),
                URLQueryItem(name: "lon", value: model?.lon ?? ""),
            ]
        }
    }
}
