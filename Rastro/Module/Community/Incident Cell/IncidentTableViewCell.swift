//
//  IncidentTableViewCell.swift
//  Rastro
//
//  Created by Karen Rodriguez on 3/30/19.
//  Copyright © 2019 Karen Rodriguez. All rights reserved.
//

import UIKit

class IncidentTableViewCell: UITableViewCell {

    static let nibName: String = "IncidentTableViewCell"
    static let reuseIdentifier: String = "IncidentTableViewCellIdentifier"
    static let rowHeight: CGFloat = 100.0
    
    @IBOutlet weak var alertImage: UIImageView!
    @IBOutlet weak var messageLabel: UILabel!
    @IBOutlet weak var locationDescriptionLabel: UILabel!
    
    var incident: Incident!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        selectionStyle = .none
        contentView.round(with: 5.0)
        applyShadow(opacity: 0.3)
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    
    func configureCell() {
        alertImage.image = incident.riskType.image
        messageLabel.text = incident.riskType.message(with: User())
        
        incident.location.lookUpCurrentLocation { (placemark) in
            if placemark != nil {
                self.locationDescriptionLabel.text = placemark?.name
            }
        }
    }
    
}
