//
//  IncidentDetailViewController.swift
//  Rastro
//
//  Created by Karen Rodriguez on 3/30/19.
//  Copyright © 2019 Karen Rodriguez. All rights reserved.
//

import UIKit
import MapKit

class IncidentDetailViewController: UIViewController {

    @IBOutlet weak var mapView: MKMapView!
    @IBOutlet weak var closeButton: UIButton!
    @IBOutlet weak var tableView: UITableView!
    
    weak var coordinator: RastroCoordinator?
    let regionRadius: CLLocationDistance = 1000
    var reports: [Report] = [Report(images: [], description: "Auto pasó a máxima velocidad por Plaza de la Independencia", location: CLLocation(latitude: 19.488734, longitude: -99.106559), likes: 3, dislikes: 0, comments: [])]
    var incident: Incident!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        configureTableView()
        configureIncident()
        closeButton.round()
    }
    
    func configureIncident() {
        centerMapOnLocation(location: incident.location)
        let annotation = MKPointAnnotation()
        annotation.coordinate = incident.location.coordinate
        mapView.addAnnotation(annotation)
        addRastros()
    }
    
    func addRastros() {
        let coordinates: [CLLocation] = [
            CLLocation(latitude: incident.location.coordinate.latitude + 0.3, longitude: incident.location.coordinate.longitude + 0.3)
        ]
        for coordinate in coordinates {
            let annotation = MKPointAnnotation()
            annotation.coordinate = coordinate.coordinate
            mapView.addAnnotation(annotation)
        }
    }
    
    func centerMapOnLocation(location: CLLocation) {
        let coordinateRegion = MKCoordinateRegion(center: location.coordinate,
                                                  latitudinalMeters: regionRadius, longitudinalMeters: regionRadius)
        mapView.setRegion(coordinateRegion, animated: true)
    }
    
    func configureTableView() {
        tableView.delegate = self
        tableView.dataSource = self
        tableView.register(UINib(nibName: ReportTableViewCell.nibName, bundle: nil), forCellReuseIdentifier: ReportTableViewCell.reuseIdentifier)
    }

    @IBAction func closeDetail(_ sender: Any) {
        dismiss(animated: true, completion: nil)
    }
}


// MARK: - TableView Data Soure & Delegate -

extension IncidentDetailViewController: UITableViewDataSource, UITableViewDelegate {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return reports.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let report = reports[indexPath.row]
        tableView.rowHeight = ReportTableViewCell.rowHeight
        let cell = tableView.dequeueReusableCell(withIdentifier: ReportTableViewCell.reuseIdentifier) as! ReportTableViewCell
        cell.report = report
        cell.configureCell()
        return cell
    }
    
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let report = reports[indexPath.row]
        coordinator?.goToReport(with: report)
    }
}
