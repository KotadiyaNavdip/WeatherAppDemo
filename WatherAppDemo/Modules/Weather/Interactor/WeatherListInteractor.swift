//
//  WeatherListInteractor.swift
//  WatherAppDemo
//
//  Created by Navdip Kotadiya on 08/08/22.
//

import UIKit

class WeatherListInteractor: WeatherListPresentorToInteractorProtocol {
    
    weak var presenter: WeatherListInteractorToPresenterProtocol?
    
    var weather: NKWeatherCodable?
    
    private let service: WeatherServiceProtocol = WeatherService()
    
    func fetchCurrentWeather(lat:Double, lon:Double) {
        let model = WeatherRequestModel(lat: "\(lat)", lon: "\(lon)")
        service.fetch(WeatherRequest.weather(model)) { [weak self] result in
            DispatchQueue.main.async {
                guard let self = self else { return }
                self.presenter?.dismissActivityIndicator()
                switch result {
                case let .success(response):
                    self.weather = response
                    self.presenter?.currentWeatherFetched()
                case let .failure(error):
                    print(error.message)
                    self.presenter?.currentWeatherFetchedFailed()
                }
            }
        }
    }
}
