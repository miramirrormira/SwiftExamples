//
//  helpers.swift
//  anony
//
//  Created by Mira Young on 11/25/19.
//  Copyright © 2019 Snaap. All rights reserved.
//

import UIKit

class Helpers {
    
    static func isTextFieldEmpty(textField: UITextField) -> Bool? {
        guard let text = textField.text else {return nil}
        var entered = false
        if !text.isEmpty {
            entered = true
        }
        return entered
    }
    
    static func ifEntriesMatch(firstTextField: UITextField, secondTextField: UITextField) -> Bool? {
        guard let firstEntry = firstTextField.text else {return nil}
        guard let secondEntry = secondTextField.text else {return nil}
        var matched = false
        if firstEntry == secondEntry {
            matched = true
        }
        return matched
    }
    
    static func isEmailAddressValid(emailString: String) -> Bool {
        var isEmail = true
        if !emailString.contains("@") {
            isEmail = false
        }
        if !emailString.contains(".") {
            isEmail = false
        }
        return isEmail
    }
    
    
    static func ifPasswordMeetRequirements(passwordString: String, minCharacters: Int) -> [PasswordRequirements:Bool] {
        
        var results = [PasswordRequirements.containsLowercaseLetter : true,
                       PasswordRequirements.containsUppercaseLetter: true,
                       PasswordRequirements.containsNumber: true,
                       PasswordRequirements.containsMinimumCharacters: true]
        
        let lowercaseLetters = NSCharacterSet.lowercaseLetters
        let uppercaseLetters = NSCharacterSet.uppercaseLetters
        let numbers = NSCharacterSet.decimalDigits
        
        if passwordString.rangeOfCharacter(from: lowercaseLetters) == nil {
            results[PasswordRequirements.containsLowercaseLetter] = false
        }
        
        if passwordString.rangeOfCharacter(from: uppercaseLetters) == nil {
            results[PasswordRequirements.containsUppercaseLetter] = false
        }
        
        if passwordString.rangeOfCharacter(from: numbers) == nil {
            results[PasswordRequirements.containsNumber] = false
        }
        
        if passwordString.count < minCharacters {
            results[PasswordRequirements.containsMinimumCharacters] = false
        }
        
        return results
    }
}
