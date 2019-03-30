//
//  CommunityViewController.swift
//  Rastro
//
//  Created by Karen Rodriguez on 3/29/19.
//  Copyright © 2019 Karen Rodriguez. All rights reserved.
//

import UIKit
import MapKit

class CommunityViewController: UIViewController {
    
    enum Tab {
        case incidents
        case reports
    }
    
    // MARK: - IBActions -
    
    @IBOutlet weak var contactsButton: UIButton!
    @IBOutlet weak var generalButton: UIButton!
    @IBOutlet weak var tableView: UITableView!
    @IBOutlet weak var descriptionLabel: UILabel!
    
    weak var coordinator: RastroCoordinator?
    var tabSelected: Tab = .incidents
    var entries: [Entry] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        configureView()
        configureTableView()
        updateFeed()
    }
    
    func configureView() {
        contactsButton.applySelectedStyle()
        generalButton.applyUnselectedStyle()
    }
    
    func configureTableView() {
        tableView.delegate = self
        tableView.dataSource = self
        tableView.register(UINib(nibName: IncidentTableViewCell.nibName, bundle: nil), forCellReuseIdentifier: IncidentTableViewCell.reuseIdentifier)
        tableView.register(UINib(nibName: ReportTableViewCell.nibName, bundle: nil), forCellReuseIdentifier: ReportTableViewCell.reuseIdentifier)
    }
    
    // MARK: - IBActions -
    
    @IBAction func selectIncidents(_ sender: Any) {
        generalButton.applyUnselectedStyle()
        contactsButton.applySelectedStyle()
        tabSelected = .incidents
        descriptionLabel.text = "Aquí podras encontrar incidencias detectadas de quienes te tienen como contacto de emergencia"
        updateFeed()
    }
    
    @IBAction func selectGeneral(_ sender: Any) {
        contactsButton.applyUnselectedStyle()
        generalButton.applySelectedStyle()
        tabSelected = .reports
        descriptionLabel.text = "Aquí podrás ver los reportes de actividades sospechosas que miembros de la comunidad han subido a la aplicación."
        updateFeed()
    }
    
    func updateFeed() {
        entries = tabSelected == .incidents ? Singleton.shared.incidents : Singleton.shared.reports
        tableView.reloadData()
    }
    
}

// MARK: - TableView Data Soure & Delegate -

extension CommunityViewController: UITableViewDataSource, UITableViewDelegate {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return entries.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let entry = entries[indexPath.row]
        if entry.type == .incident {
            tableView.rowHeight = IncidentTableViewCell.rowHeight
            let cell = tableView.dequeueReusableCell(withIdentifier: IncidentTableViewCell.reuseIdentifier) as! IncidentTableViewCell
            cell.incident = entry.incidentDetail!
            cell.configureCell()
            return cell
        } else {
            tableView.rowHeight = ReportTableViewCell.rowHeight
            let cell = tableView.dequeueReusableCell(withIdentifier: ReportTableViewCell.reuseIdentifier) as! ReportTableViewCell
            cell.report = entry.reportDetail!
            cell.configureCell()
            return cell
        }
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let entry = entries[indexPath.row]
        if entry.type == .report {
            coordinator?.goToReport(with: entry.reportDetail)
        } else {
            coordinator?.goToIncidentDetail(with: entry.incidentDetail!, from: self)
        }
    }
}
