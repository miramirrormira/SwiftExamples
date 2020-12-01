//
//  PinCodeView.swift
//  anony
//
//  Created by Mira Young on 11/23/19.
//  Copyright © 2019 Snaap. All rights reserved.
//

import UIKit

class PinCodeView: UIView, PinCodeTextFieldProtocol {
    
    var pinTextFields = [PINTextField]()
    
    var onPinInputComplete: ((Bool, String)->())?
    
    /*--------------------------------------------------------*
     * Variable: pinDigits                                    *
     * definition: number of pin codes in the PinCodeView     *
     * didSet: when pinDigits is set to an integer x,         *
     *          first remove all text fields in pinTextFields *
     *          second generate x new text fields and         *
     *          and append them to pinTextField               *
     *--------------------------------------------------------*/
    var pinDigits: Int = 1 {
        didSet {
            for pin in pinTextFields {
                pin.removeFromSuperview()
            }
            pinTextFields.removeAll()
            
            for _ in 0 ..< pinDigits {
                let pinTextField = PINTextField(frame: CGRect.zero)
                pinTextFields.append(pinTextField)
                self.addSubview(pinTextField)
                pinTextField.textAlignment = .center
                pinTextField.delegate = self
                pinTextField.keyboardType = .numberPad
                pinTextField.addTarget(self, action: #selector(textFieldContentDidChange(_:)), for: .editingChanged)
                pinTextField.addTarget(self, action: #selector(textFieldContentDidEnd(_:)), for: .editingDidEnd)
            }
        }
    }
    
    // Protocal variable and function
    var isFilled: Bool {
        for pin in pinTextFields {
            if !pin.isFilled {
                return false
            }
        }
        return true
    }
    
    var pinCodes: String {
        var pinCode = ""
        let _ = self.pinTextFields.map{ pinCode += $0.pinNumber }
        return pinCode
    }
    
    func didPressBackspace(textField: PINTextField) {
        becomeFirstResponder(before: textField)
    }
    
    override init(frame: CGRect) {
        super.init(frame: CGRect.zero)
        
        backgroundColor = .black
        translatesAutoresizingMaskIntoConstraints = false
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        let startX = frame.width/2 - CGFloat(pinDigits)*40/CGFloat(2.0)-1
        for (i, tf) in pinTextFields.enumerated() {
            tf.frame = CGRect(x: (startX+CGFloat(i*38+i*2)), y: 8, width: 38, height: 38)
        }
    }
    
    @objc func textFieldContentDidEnd(_ textField: UITextField) {
        if let method = self.onPinInputComplete {
            method(self.isFilled, self.pinCodes)
        }
    }
    
    @objc func textFieldContentDidChange(_ textField: UITextField) {
        guard let textField = textField as? PINTextField else { return }
        if textField.pinNumber.count == 0 {
            becomeFirstResponder(before: textField)
        }
        
        // when textfield has been filled, ok! next!
        if textField.pinNumber.count == textField.maxCharacterCount {
            becomeFirstResponder(after: textField)
        }
    }
    
    func textField(_ textField: UITextField, shouldChangeCharactersIn range: NSRange, replacementString string: String) -> Bool {
        guard let textField = textField as? PINTextField else { return true }
        
        if string == "" {
            return true
        }
        
        // when textfield is not empty, well, next
        if textField.pinNumber.count == textField.maxCharacterCount {
            becomeFirstResponder(after: textField)
            return false
        }
        if string.count > textField.maxCharacterCount {
            return false
        }
        return true
    }
    
    func becomeFirstResponder(after textField: UITextField) {
        becomeFirstResponder(of: textField, offset: 1)
    }
    func becomeFirstResponder(before textField: UITextField) {
        becomeFirstResponder(of: textField, offset: -1)
    }
    
    @discardableResult
    private func becomeFirstResponder(of textField: UITextField, offset by: Int) -> Bool {
        var result = false
        if let i = pinTextFields.firstIndex(of: textField as! PINTextField) {
            textField.resignFirstResponder()
            if (0..<self.pinDigits).contains(i+by) {
                result = self.pinTextFields[i+by].becomeFirstResponder()
            } else {

            }
        }
        return result
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
}
