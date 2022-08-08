//
//  WeatherListRouter.swift
//  WatherAppDemo
//
//  Created by Navdip Kotadiya on 08/08/22.
//

import UIKit

class WeatherListRouter: WeatherListPresenterToRouterProtocol {
    
    static func createModule() -> UIViewController {
        let view = WeatherSevenDaysListVC()
        let presenter: WeatherListViewToPresenterProtocol & WeatherListInteractorToPresenterProtocol = WeatherListPresenter()
        let interactor: WeatherListPresentorToInteractorProtocol = WeatherListInteractor()
        let router: WeatherListPresenterToRouterProtocol = WeatherListRouter()
        
        view.presenter = presenter
        presenter.view = view
        presenter.router = router
        presenter.interactor = interactor
        interactor.presenter = presenter
        return view
    }
    
}
