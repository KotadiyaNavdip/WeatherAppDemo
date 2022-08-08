//
//  WeatherVC.swift
//  WatherAppDemo
//
//  Created by Navdip Kotadiya on 08/08/22.
//

import UIKit

class WeatherVC: UIViewController {

    @IBOutlet private var btnAllow:UIButton?
    @IBOutlet private var lblLocation:UILabel?
    @IBOutlet private var imgWeather:UIImageView?
    @IBOutlet private var lblTemprature:UILabel?
    @IBOutlet private var lblWeatheType:UILabel?
    @IBOutlet private var lblDate:UILabel?
    @IBOutlet private weak var collectionView:UICollectionView!
    
    var presenter: WeatherViewToPresenterProtocol?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setUpCollectionView()
        self.showView(false)
        DispatchQueue.main.async {
            self.onClickAllowLocation()
        }
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        checkPermission()
    }
    
    private func setUpCollectionView() {
        collectionView.dataSource = self
        collectionView.delegate = self
        collectionView.register(UINib(nibName: WeatherTodayCVC.className, bundle: .main), forCellWithReuseIdentifier: WeatherTodayCVC.className)
    }
    
    private func showView(_ value:Bool) {
        view.subviews.forEach { v in
            if v.tag == 1991 {
                v.isHidden = !value
            }
        }
    }
    
    private func checkPermission() {
        if NKLocation.m.checkPermission() {
            if presenter?.getWeather() == nil {
                NKProgress.show(inView: view)
            }
            NKLocation.m.configure()
            NKLocation.m.onceUpdateLocation = { location in
                guard let location = location else {
                    NKProgress.dismiss()
                    return
                }
                location.getCity { city in
                    self.lblLocation?.text = city?.capitalized ?? "N/A"
                }
                self.presenter?.updateView(lat: location.coordinate.latitude, lon: location.coordinate.longitude)
            }
            self.btnAllow?.isHidden = true
        } else {
            self.btnAllow?.isHidden = false
            self.showView(false)
        }
    }
    
    @IBAction private func onClickAllowLocation() {
        _ = NKLocation.m.checkPermission(self)
    }
    
    
    @IBAction private func onClickShowSevenDays() {
        let vc = WeatherSevenDaysListVC()
        vc.presenter = self.presenter
        self.navigationController?.pushViewController(vc, animated: true)
    }
    
}


extension WeatherVC: UICollectionViewDelegate, UICollectionViewDataSource {
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return presenter?.getWeatherHoursCount() ?? 0
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: WeatherTodayCVC.className, for: indexPath) as! WeatherTodayCVC
        cell.data = presenter?.getWeatherHours(index: indexPath.item)
        return cell
    }
}

extension WeatherVC: WeatherPresenterToViewProtocol {
    
    func dismissActivityIndicator() {
        NKProgress.dismiss()
    }
    
    func showCurrentWeather() {
        NKProgress.dismiss()
        self.showView(true)
        let weather = presenter?.getWeather()
        imgWeather?.setImageUrl(weather?.current?.weather?.first?.icon?.asWeatherIcon)
        lblTemprature?.text = "\(Int(weather?.current?.temp ?? 0))"
        lblWeatheType?.text = weather?.current?.weather?.first?.main ?? "N/A"
        lblDate?.text = weather?.current?.dt?.asDateOnly
        collectionView.reloadData()
    }
    
    func showError() {
        NKProgress.dismiss()
        let alert = UIAlertController(title: "Alert", message: "Problem Fetching Current Weather", preferredStyle: UIAlertController.Style.alert)
        alert.addAction(UIAlertAction(title: "Okay", style: UIAlertAction.Style.default, handler: nil))
        self.present(alert, animated: true, completion: nil)
        self.showView(false)
    }
}

