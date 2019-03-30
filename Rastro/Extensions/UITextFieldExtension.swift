//
//  UITextFieldExtension.swift
//  MiTPV
//
//  Created by Karen Rodriguez on 30/10/18.
//  Copyright © 2018 Yamblet. All rights reserved.
//

import Foundation
import UIKit

extension UITextField {
    
    open override func awakeFromNib() {
        super.awakeFromNib()
        placeholder = placeholder?.localized(bundle: .main, tableName: "UI")
    }
    
    func applyAppStyle() {
        applyShadow(opacity: 0.2)
        round(with: 5.0)
    }
    
    func addShowHidePasswordButton(withHideImage hideImage: UIImage, andShowImage showImage: UIImage, imageWidth: CGFloat, verticalPadding: CGFloat = 5.0, rightPadding: CGFloat = 15.0) {
        isSecureTextEntry = true
        let showHideButton = ShowHideButton(type: .custom)
        showHideButton.hideImage = hideImage
        showHideButton.showImage = showImage
        showHideButton.setImage(hideImage, for: .normal)
        showHideButton.addTarget(self, action: #selector(showHidePassword), for: .touchUpInside)
//        showHideButton.frame = CGRect(x: frame.size.width-imageWidth-rightPadding, y: frame.center.y-verticalPadding, width: imageWidth+rightPadding, height: frame.size.height-(verticalPadding*2))
        superview?.addSubview(showHideButton)
    }
    
    @objc func showHidePassword(sender: ShowHideButton) {
        isSecureTextEntry = !isSecureTextEntry
        if isSecureTextEntry {
            sender.setImage(sender.hideImage, for: .normal)
        } else {
            sender.setImage(sender.showImage, for: .normal)
        }
    }
    
    func addRightImage(image: UIImage, imageWidth: CGFloat, height: CGFloat, verticalPadding: CGFloat = 20.0, rightPadding: CGFloat = 5.0) {
        let imageView = UIImageView()
        imageView.image = image
        imageView.frame = CGRect(x: frame.size.width-imageWidth-rightPadding, y: verticalPadding, width: imageWidth, height: height)
        addSubview(imageView)
    }
    
    func setLeftPaddingPoints(_ amount:CGFloat){
        let paddingView = UIView(frame: CGRect(x: 0, y: 0, width: amount, height: self.frame.size.height))
        self.leftView = paddingView
        self.leftViewMode = .always
    }
    
    func setRightPaddingPoints(_ amount:CGFloat) {
        let paddingView = UIView(frame: CGRect(x: 0, y: 0, width: amount, height: self.frame.size.height))
        self.rightView = paddingView
        self.rightViewMode = .always
    }
    
    func applyMiTPVTextFieldStyle(showHideButton: Bool = false) {
        backgroundColor = UIColor.clear
        font = UIFont.avenir(type: .none, size: 17.0)
        textColor = UIColor.black
        if showHideButton {
            addShowHidePasswordButton(withHideImage: UIImage(named: "hidePass") ?? UIImage(), andShowImage: UIImage(named: "showPass") ?? UIImage(), imageWidth: 25.0, verticalPadding: 10.0)
        }
    }
    
    func setBottomBorder() {
        self.borderStyle = .none
        self.layer.backgroundColor = UIColor.white.cgColor
        
        self.layer.masksToBounds = false
        self.layer.shadowColor = UIColor.gray.cgColor
        self.layer.shadowOffset = CGSize(width: 0.0, height: 1.0)
        self.layer.shadowOpacity = 1.0
        self.layer.shadowRadius = 0.0
    }
    
}
