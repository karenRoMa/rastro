//
//  ReportDetailViewController.swift
//  Rastro
//
//  Created by Karen Rodriguez on 3/30/19.
//  Copyright © 2019 Karen Rodriguez. All rights reserved.
//

import UIKit
import MapKit

class ReportDetailViewController: UIViewController {

    // MARK: - IBOUtlets
    
    @IBOutlet weak var reportImage: UIButton!
    @IBOutlet weak var mapView: MKMapView!
    @IBOutlet weak var descriptionTextView: UITextView!
    @IBOutlet weak var likeButton: UIButton!
    @IBOutlet weak var dislikeButton: UIButton!
    @IBOutlet weak var likesLabel: UILabel!
    @IBOutlet weak var dislikeLabel: UILabel!
    @IBOutlet weak var tableView: UITableView!
    @IBOutlet weak var approvalStackView: UIStackView!
    @IBOutlet weak var closeButton: UIButton!
    
    let locationManager = CLLocationManager()
    var report: Report?
    let regionRadius: CLLocationDistance = 1000
    var location: CLLocation!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        configureView()
        configureReport()
        // Do any additional setup after loading the view.
    }

    func configureView() {
        reportImage.round(with: 5.0)
        reportImage.applyShadow(opacity: 0.3)
        closeButton.round()
        descriptionTextView.round(with: 5.0)
    }
    
    func configureReport() {
        guard let validReport = report else {
            descriptionTextView.isEditable = true
            approvalStackView.isHidden = true
            tableView.isHidden = true
            
            mapView.showsUserLocation = true
            // Ask for Authorisation from the User.
            self.locationManager.requestAlwaysAuthorization()
            
            // For use in foreground
            self.locationManager.requestWhenInUseAuthorization()
            
            if CLLocationManager.locationServicesEnabled() {
                locationManager.delegate = self
                locationManager.desiredAccuracy = kCLLocationAccuracyNearestTenMeters
                locationManager.startUpdatingLocation()
            }
            return
        }
        
        centerMapOnLocation(location: validReport.location)
        let annotation = MKPointAnnotation()
        annotation.coordinate = validReport.location.coordinate
        mapView.addAnnotation(annotation)
        descriptionTextView.text = validReport.description
        likesLabel.text = "\(validReport.likes)"
        dislikeLabel.text = "\(validReport.dislikes)"
        
        if validReport.images.count > 0 {
            reportImage.setImage(validReport.images.first, for: .normal)
        }
    }
    
    func centerMapOnLocation(location: CLLocation) {
        let coordinateRegion = MKCoordinateRegion(center: location.coordinate,
                                                  latitudinalMeters: regionRadius, longitudinalMeters: regionRadius)
        mapView.setRegion(coordinateRegion, animated: true)
    }
    
    @IBAction func likeReport(_ sender: Any) {
        guard let report = report else {return}
        likesLabel.text = "\(report.likes+1)"
    }
    
    @IBAction func dislikeReport(_ sender: Any) {
        guard let report = report else {return}
        dislikeLabel.text = "\(report.dislikes+1)"
    }
    
    @IBAction func closeDetail(_ sender: Any) {
        self.dismiss(animated: true, completion: nil)
    }
}

// MARK: CLLocationManagerDelegate

extension ReportDetailViewController: CLLocationManagerDelegate {
    func locationManager(_ manager: CLLocationManager, didUpdateLocations locations: [CLLocation]) {
        guard let locValue: CLLocation = manager.location else { return }
        centerMapOnLocation(location: locValue)
        self.location = locations.last
    }
}

// MARK: - TableView delegate & Data Source -


