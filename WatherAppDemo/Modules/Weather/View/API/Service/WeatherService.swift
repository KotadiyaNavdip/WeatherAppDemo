//
//  WeatherService.swift
//  WatherAppDemo
//
//  Created by Navdip Kotadiya on 08/08/22.
//

import UIKit


protocol WeatherServiceProtocol {
    func fetch(_ request: WeatherRequest, completionHandler: @escaping (ResultResponse<NKWeatherCodable>) -> Void)
}

final class WeatherService: WeatherServiceProtocol {
    
    private let networkRequester: NetworkRequester

    init(networkRequester: NetworkRequester = .init()) {
        self.networkRequester = networkRequester
    }
    
    func fetch(_ request: WeatherRequest, completionHandler: @escaping (ResultResponse<NKWeatherCodable>) -> Void) {
        networkRequester.doRequest(request: request, completionHandler: completionHandler)
    }
}
