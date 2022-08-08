//
//  WeatherModelTests.swift
//  WatherAppDemoTests
//
//  Created by Navdip Kotadiya on 08/08/22.
//

import XCTest
@testable import WatherAppDemo

class WeatherModelTests: XCTestCase {

    var view:WeatherVC!
    var presenter: MockWeatherPresenter!
    var interactor: WeatherPresentorToInteractorProtocol!
    var router: WeatherPresenterToRouterProtocol!
    
    override func setUp() {
        view = WeatherVC()
        presenter = MockWeatherPresenter()
        interactor = WeatherInteractor()
        router = WeatherRouter()
        
        view.presenter = presenter
        presenter.view = view
        presenter.router = router
        presenter.interactor = interactor
        interactor.presenter = presenter
    }
    
    override func tearDown() {
        view = nil
        presenter = nil
        interactor = nil
        router = nil
    }
    
    func test_fetchCurrentWeather_with_success() throws {
        interactor.fetchCurrentWeather(lat: 23.0225, lon: 72.5714)
        XCTAssertFalse(presenter.isActivityIndicatorDismissed)
    }
    
    func test_fetchCurrentWeather_with_failure() throws {
        interactor.fetchCurrentWeather(lat: 23.0225, lon: 72.5714)
        XCTAssertTrue(presenter.isCurrentWeatherFetchedFailed)
    }
}
