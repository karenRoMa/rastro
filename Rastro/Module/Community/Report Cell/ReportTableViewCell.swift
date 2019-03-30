//
//  ReportTableViewCell.swift
//  Rastro
//
//  Created by Karen Rodriguez on 3/30/19.
//  Copyright © 2019 Karen Rodriguez. All rights reserved.
//

import UIKit
import MapKit

class ReportTableViewCell: UITableViewCell {

    static let nibName: String = "ReportTableViewCell"
    static let reuseIdentifier: String = "ReportTableViewCellIdentifier"
    static let rowHeight: CGFloat = 150.0
    
    @IBOutlet weak var mapView: MKMapView!
    @IBOutlet weak var reportTitleLabel: UILabel!
    @IBOutlet weak var locationDescriptionLabel: UILabel!
    
    var report: Report!
    let regionRadius: CLLocationDistance = 1000
    
    override func awakeFromNib() {
        super.awakeFromNib()
        configureView()
    }
    
    func configureView() {
        selectionStyle = .none
        contentView.applyShadow(opacity: 0.3)
        round(with: 5.0)
        mapView.isUserInteractionEnabled = false
        mapView.round(with: 5.0)
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    func configureCell() {
        reportTitleLabel.text = report.description
        centerMapOnLocation(location: self.report.location)
        report.location.lookUpCurrentLocation { (placemark) in
            if placemark != nil {
                self.locationDescriptionLabel.text = placemark?.name
            }
        }
        let annotation = MKPointAnnotation()
        annotation.coordinate = report.location.coordinate
        mapView.addAnnotation(annotation)
    }

    func centerMapOnLocation(location: CLLocation) {
        let coordinateRegion = MKCoordinateRegion(center: location.coordinate,
                                                  latitudinalMeters: regionRadius, longitudinalMeters: regionRadius)
        mapView.setRegion(coordinateRegion, animated: true)
    }
    
}
