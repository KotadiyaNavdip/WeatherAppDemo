//
//  WatherTodayCVC.swift
//  WatherAppDemo
//
//  Created by Navdip Kotadiya on 08/08/22.
//

import UIKit

class WeatherTodayCVC: UICollectionViewCell {
    
    @IBOutlet var lblTime:UILabel!
    @IBOutlet var imgView:UIImageView!
    @IBOutlet var lblTemprature:UILabel!
    
    var data:NKWeatherCurrent? {
        didSet {
            lblTime.text = data?.dt?.asTimeOnly
            imgView.setImageUrl(data?.weather?.first?.icon?.asWeatherIcon)
            lblTemprature.text = "\(Int(data?.temp ?? 0))°"
        }
    }
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }
    
}
