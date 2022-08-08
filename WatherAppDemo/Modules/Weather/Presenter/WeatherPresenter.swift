//
//  WeatherPresenter.swift
//  WatherAppDemo
//
//  Created by Navdip Kotadiya on 08/08/22.
//

import UIKit

class WeatherPresenter: WeatherViewToPresenterProtocol {
    
    weak var view: WeatherPresenterToViewProtocol?
    var interactor: WeatherPresentorToInteractorProtocol?
    var router: WeatherPresenterToRouterProtocol?
    
    func updateView(lat:Double, lon:Double) {
        interactor?.fetchCurrentWeather(lat: lat, lon: lon)
    }
    
    func getWeather() -> NKWeatherCodable? {
        return interactor?.weather
    }
    
    func getWeatherHoursCount() -> Int {
        interactor?.weather?.hourly?.count ?? 0
    }
    
    func getWeatherHours(index: Int) -> NKWeatherCurrent? {
        interactor?.weather?.hourly?[index]
    }
    
    func getWeatherDailyCount() -> Int {
        interactor?.weather?.daily?.count ?? 0
    }
    
    func getWeatherDaily(index: Int) -> NKWeatherDaily? {
        interactor?.weather?.daily?[index]
    }
}

extension WeatherPresenter: WeatherInteractorToPresenterProtocol {
    func dismissActivityIndicator() {
        view?.dismissActivityIndicator()
    }
    
    func currentWeatherFetched() {
        view?.showCurrentWeather()
    }
    
    func currentWeatherFetchedFailed() {
        view?.showError()
    }
}
