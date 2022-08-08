//
//  WeatherProtocols.swift
//  WatherAppDemo
//
//  Created by Navdip Kotadiya on 08/08/22.
//

import UIKit

protocol WeatherPresenterToViewProtocol: class {
    func showCurrentWeather()
    func showError()
    func dismissActivityIndicator()
}

protocol WeatherInteractorToPresenterProtocol: class {
    func currentWeatherFetched()
    func currentWeatherFetchedFailed()
    func dismissActivityIndicator()
}

protocol WeatherPresentorToInteractorProtocol: class {
    var presenter: WeatherInteractorToPresenterProtocol? { get set }
    var weather: NKWeatherCodable? { get set }
    func fetchCurrentWeather(lat:Double, lon:Double)
}

protocol WeatherViewToPresenterProtocol: class {
    var view: WeatherPresenterToViewProtocol? { get set }
    var interactor: WeatherPresentorToInteractorProtocol? { get set }
    var router: WeatherPresenterToRouterProtocol? { get set }
    
    func updateView(lat:Double, lon:Double)
    func getWeather() -> NKWeatherCodable?
    
    func getWeatherHoursCount() -> Int
    func getWeatherHours(index:Int) -> NKWeatherCurrent?
}

protocol WeatherPresenterToRouterProtocol: class {
    static func createModule() -> UIViewController
}




// Save Days list
protocol WeatherListPresenterToViewProtocol: class {
    func showCurrentWeather()
    func showError()
    func dismissActivityIndicator()
}

protocol WeatherListInteractorToPresenterProtocol: class {
    func currentWeatherFetched()
    func currentWeatherFetchedFailed()
    func dismissActivityIndicator()
}

protocol WeatherListViewToPresenterProtocol: class {
    
    var view: WeatherListPresenterToViewProtocol? { get set }
    var interactor: WeatherListPresentorToInteractorProtocol? { get set }
    var router: WeatherListPresenterToRouterProtocol? { get set }
    
    func updateView(lat:Double, lon:Double)
    
    func getWeatherDailyCount() -> Int
    func getWeatherDaily(index:Int) -> NKWeatherDaily?
}

protocol WeatherListPresentorToInteractorProtocol: class {
    var presenter: WeatherListInteractorToPresenterProtocol? { get set }
    var weather: NKWeatherCodable? { get set }
    func fetchCurrentWeather(lat:Double, lon:Double)
}

protocol WeatherListPresenterToRouterProtocol: class {
    static func createModule() -> UIViewController
}
