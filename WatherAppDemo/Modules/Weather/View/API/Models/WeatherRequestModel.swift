//
//  WeatherRequestModel.swift
//  WatherAppDemo
//
//  Created by Navdip Kotadiya on 08/08/22.
//

import UIKit

struct WeatherRequestModel: Codable {
    let lat: String
    let lon: String
    
    enum CodingKeys: String, CodingKey {
        case lat
        case lon
    }
}
