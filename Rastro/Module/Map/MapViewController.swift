//
//  MapViewController.swift
//  Rastro
//
//  Created by Karen Rodriguez on 3/29/19.
//  Copyright © 2019 Karen Rodriguez. All rights reserved.
//

import UIKit
import MapKit
import Lottie

class MapViewController: UIViewController {

    // MARK: - IBOutlets -
    
    @IBOutlet weak var mapView: MKMapView!
    @IBOutlet weak var refreshButton: UIButton!
    @IBOutlet weak var reportButton: UIButton!
    
    // MARK: - Stored Properties -
    
    let locationManager = CLLocationManager()
    var location: CLLocation!
    let regionRadius: CLLocationDistance = 1000
    weak var coordinator: RastroCoordinator?
    
    //Local Search
    var searchCompleter = MKLocalSearchCompleter()
    var searchResults = [MKLocalSearchCompletion]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        configureView()
    }
    
    func configureView() {
        reportButton.applyEnabledButtonStyle()
        addReportAnnotations()
        addPanicButton()
        refreshButton.round()
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
    }
    
    @IBAction func refreshLocation(_ sender: Any) {
        let center = CLLocationCoordinate2D(latitude: location.coordinate.latitude, longitude: location.coordinate.longitude)
        let region = MKCoordinateRegion(center: center, span: MKCoordinateSpan(latitudeDelta: 0.01, longitudeDelta: 0.01))
        
        self.mapView.setRegion(region, animated: true)
    }
    
    func centerMapOnLocation(location: CLLocation) {
        let coordinateRegion = MKCoordinateRegion(center: location.coordinate,
                                                  latitudinalMeters: regionRadius, longitudinalMeters: regionRadius)
        mapView.setRegion(coordinateRegion, animated: true)
    }
    
    func addReportAnnotations() {
        for report in Singleton.shared.reports {
            let annotation = MKPointAnnotation()
            annotation.coordinate = report.reportDetail!.location.coordinate
            mapView.addAnnotation(annotation)
        }
    }
    
    @IBAction func report(_ sender: Any) {
        coordinator?.goToReport(with: nil)
    }
    
}

extension MapViewController: CLLocationManagerDelegate {
    func locationManager(_ manager: CLLocationManager, didUpdateLocations locations: [CLLocation]) {
        guard let locValue: CLLocation = manager.location else { return }
        centerMapOnLocation(location: locValue)
        self.location = locations.last
    }
}
