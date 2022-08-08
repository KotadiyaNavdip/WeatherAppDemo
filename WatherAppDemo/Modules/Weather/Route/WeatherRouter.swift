//
//  WeatherRouter.swift
//  WatherAppDemo
//
//  Created by Navdip Kotadiya on 08/08/22.
//

import UIKit

class WeatherRouter: WeatherPresenterToRouterProtocol {
    static func createModule() -> UIViewController {
        let view = WeatherVC()
        let presenter: WeatherViewToPresenterProtocol & WeatherInteractorToPresenterProtocol = WeatherPresenter()
        let interactor: WeatherPresentorToInteractorProtocol = WeatherInteractor()
        let router: WeatherPresenterToRouterProtocol = WeatherRouter()
        
        view.presenter = presenter
        presenter.view = view
        presenter.router = router
        presenter.interactor = interactor
        interactor.presenter = presenter
        let navi = UINavigationController(rootViewController: view)
        return navi
    }
}
