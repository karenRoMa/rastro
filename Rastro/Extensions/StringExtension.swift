//
//  StringExtension.swift
//
//  Created by Karen Rodriguez on 28/05/18.
//  Copyright © 2018 Karen Rodriguez. All rights reserved.
//

import Foundation

extension String {
    /// Checks if a string is a valid phone number
    func isValidPhoneNumber() -> Bool {
        let numberRegEx = "^([+][0-9]{1,2}[ ])?[0-9]{8,}$"
        let numberTest = NSPredicate(format: "SELF MATCHES %@", numberRegEx)
        return numberTest.evaluate(with: self)
    }
    
    /// Checks if a string is a valid number
    func isValidNumber() -> Bool {
        let numberRegEx = "^[0-9]*$"
        let numberTest = NSPredicate(format: "SELF MATCHES %@", numberRegEx)
        return numberTest.evaluate(with: self)
    }

    /// Checks if a string is a valid email
    func isValidEmail() -> Bool {
        let emailRegEx = "[A-Z0-9a-z._%+-]+@[A-Za-z0-9.-]+\\.[A-Za-z]{2,64}"
        let emailTest = NSPredicate(format: "SELF MATCHES %@", emailRegEx)
        return emailTest.evaluate(with: self)
    }
    
    /// Checks if a string is a valid rfc
    func isValidRFC() -> Bool {
        let rfcRegEx = "^([A-ZÑ&]{3,4}) ?(?:- ?)?(\\d{2}(?:0[1-9]|1[0-2])(?:0[1-9]|[12]\\d|3[01])) ?(?:- ?)?([A-Z\\d]{2})([A\\d])$"
        let rfcTest = NSPredicate(format: "SELF MATCHES %@", rfcRegEx)
        return rfcTest.evaluate(with: self)
    }
    
    /// Checks if a string is a valid CLABE
    func isValidCLABE() -> Bool {
        let cableRegEx = "^[0-9]{18}$"
        let cableTest = NSPredicate(format: "SELF MATCHES %@", cableRegEx)
        return cableTest.evaluate(with: self)
    }
    
    /// Checks is a string is a valid password
    func isValidPassword() -> Bool {
        let passwordRegEx = "^[A-Z0-9a-z._%+-]{8,}$"
        let passwordTest = NSPredicate(format: "SELF MATCHES %@", passwordRegEx)
        return passwordTest.evaluate(with: self)
    }
    
    /// Localizable strings
    func localized(bundle: Bundle = .main, tableName: String = "Localizable") -> String {
        return NSLocalizedString(self, tableName: tableName, value: self, comment: "")
    }
    
    /// Adds digit at the end of the string respecting the decimal point
    func add(_ digit: String, limit: Int) -> String {
        if self.count-3 == limit {
            return self
        }
        let initialDigit = digit
        var digit = digit
        if digit.count > 1 {
            digit = String(digit.first!)
        }
        var beforePoint = ""
        var afterPoint = self
        for (index,letter) in self.enumerated() {
            afterPoint = String(afterPoint.dropFirst())
            if letter == "." {
                break
            } else {
                beforePoint.append(letter)
                if index == 0 && letter == "0" {
                    afterPoint = String(afterPoint.dropFirst())
                    break
                }
            }
        }
        guard afterPoint.count > 0 else {return beforePoint}
        if beforePoint != "0" {
            beforePoint.append(afterPoint.first!)
        } else if afterPoint.first != "0" {
            beforePoint = String(afterPoint.first!)
        }
        afterPoint = String(afterPoint.dropFirst())
        if initialDigit.count > 1 {
            return "\(beforePoint).\(afterPoint)\(digit)".add(String(initialDigit.dropFirst()), limit: limit)
        }
        return "\(beforePoint).\(afterPoint)\(digit)"
    }

    /// Removes last digit of an amount keeping the format $.$$
    func removeLastDigit() -> String {
        var beforePoint = ""
        var afterPoint = self
        for letter in self {
            afterPoint = String(afterPoint.dropFirst())
            if letter == "." {
                break
            } else {
                beforePoint.append(letter)
            }
        }

        afterPoint.insert(beforePoint.last!, at: .init(encodedOffset: 0))
        afterPoint = String(afterPoint.dropLast())
        if beforePoint.count == 1 {
            beforePoint = "0"
        } else {
            beforePoint = String(beforePoint.dropLast())
        }
        
        return "\(beforePoint).\(afterPoint)"
    }
    
    func camelToSnakeCase() -> String {
        var snake_case_string = ""
        let strUpper = "[A-Z0-9]";
        let strTest = NSPredicate(format:"SELF MATCHES %@", strUpper );
        
        for letter in self {
            if strTest.evaluate(with: String(letter)) {
                snake_case_string.append("_")
                snake_case_string.append(String(letter).lowercased())
            } else {
                snake_case_string.append(letter)
            }
        }
        return snake_case_string
    }

}
