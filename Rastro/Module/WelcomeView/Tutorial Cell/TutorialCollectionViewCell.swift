//
//  TutorialCollectionViewCell.swift
//  Kirola
//
//  Created by Karen Rodriguez on 29/10/18.
//  Copyright © 2018 Yamblet. All rights reserved.
//

import UIKit
import Gemini

class TutorialCollectionViewCell: GeminiCell {
 
    static let nibName: String = "TutorialCollectionViewCell"
    static let reuseIdentifier: String = "TutorialCollectionViewCellIdentifier"
    
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var descriptionTextView: UITextView!
    @IBOutlet weak var imageView: UIImageView!
    
    func configureCell(withInfo information: [String: String]) {
        titleLabel.text = information["title"]
        imageView.image = UIImage(named: information["image"]!)!
        
        let attributedString = NSMutableAttributedString(string: information["content"] ?? "")
        let paragraphStyle = NSMutableParagraphStyle()
        paragraphStyle.lineSpacing = 5
        paragraphStyle.alignment = .center
        let attributes: [NSAttributedString.Key: Any] = [.paragraphStyle: paragraphStyle, .font: UIFont.avenir(type: .none, size: 16.0), .foregroundColor: UIColor.mediumPurple()]
        attributedString.addAttributes(attributes, range: NSMakeRange(0, attributedString.length))
        descriptionTextView.attributedText = attributedString
    }

}
