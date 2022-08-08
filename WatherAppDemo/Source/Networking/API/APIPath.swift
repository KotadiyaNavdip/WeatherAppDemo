//
//  APIPath.swift
//  WatherAppDemo
//
//  Created by Navdip Kotadiya on 08/08/22.
//

import UIKit

enum APIPath {
    case weather
    
    var rawValue: String {
        switch self {
        case .weather: return "/data/2.5/onecall"
        }
    }
}

