//
//  MockWeatherPresenter.swift
//  WatherAppDemoTests
//
//  Created by Navdip Kotadiya on 08/08/22.
//

@testable import WatherAppDemo
import UIKit

class MockWeatherPresenter: WeatherViewToPresenterProtocol {
    var view: WeatherPresenterToViewProtocol?
    
    var interactor: WeatherPresentorToInteractorProtocol?
    
    var router: WeatherPresenterToRouterProtocol?
    
    func updateView(lat: Double, lon: Double) {
        interactor?.fetchCurrentWeather(lat: lat, lon: lon)
    }
    
    func getWeather() -> NKWeatherCodable? {
        return interactor?.weather
    }
    
    func getWeatherHoursCount() -> Int {
        return interactor?.weather?.hourly?.count ?? 0
    }
    
    func getWeatherHours(index: Int) -> NKWeatherCurrent? {
        return interactor?.weather?.hourly?[index]
    }
    
    func getWeatherDailyCount() -> Int {
        return interactor?.weather?.daily?.count ?? 0
    }
    
    func getWeatherDaily(index: Int) -> NKWeatherDaily? {
        return interactor?.weather?.daily?[index]
    }
    
    var isActivityIndicatorDismissed = false
    var isCurrentWeatherFetched = false
    var isCurrentWeatherFetchedFailed = false
}

extension MockWeatherPresenter: WeatherInteractorToPresenterProtocol {
    
    func dismissActivityIndicator() {
        isActivityIndicatorDismissed = true
    }

    func currentWeatherFetched() {
        isCurrentWeatherFetched = true
    }
    
    func currentWeatherFetchedFailed() {
        isCurrentWeatherFetchedFailed = true
    }
    
}

