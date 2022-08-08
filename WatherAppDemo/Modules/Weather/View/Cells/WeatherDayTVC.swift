//
//  WeatherDayTVC.swift
//  WatherAppDemo
//
//  Created by Navdip Kotadiya on 08/08/22.
//

import UIKit

class WeatherDayTVC: UITableViewCell {
    
    @IBOutlet private weak var lblDate:UILabel?
    @IBOutlet private weak var imgWeathe:UIImageView?
    @IBOutlet private weak var lblWeatherType:UILabel?
    @IBOutlet private weak var lblTemperature:UILabel?

    var data:NKWeatherDaily? {
        didSet {
            let date = data?.dt?.asDate
            if date?.isToday == true {
                lblDate?.text = "Today"
            } else {
                lblDate?.text = data?.dt?.asDateDayOnly ?? "N/A"
            }
            imgWeathe?.setImageUrl(data?.weather?.first?.icon?.asWeatherIcon)
            lblWeatherType?.text = data?.weather?.first?.main ?? "N/A"
            lblTemperature?.text = "\(Int(data?.temp?.min ?? 0))° - \(Int(data?.temp?.max ?? 0))°"
        }
    }
    
    override func awakeFromNib() {
        super.awakeFromNib()
        backgroundColor = .clear
        selectionStyle = .none
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
}
