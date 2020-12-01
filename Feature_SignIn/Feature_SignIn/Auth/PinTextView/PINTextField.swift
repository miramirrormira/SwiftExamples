//
//  PINTextField.swift
//  anony
//
//  Created by Mira Young on 11/22/19.
//  Copyright © 2019 Snaap. All rights reserved.
//

import UIKit

protocol PinCodeTextFieldProtocol: UITextFieldDelegate {
    var isFilled: Bool { get }
    var pinCodes: String { get }
    func didPressBackspace(textField : PINTextField)
}

class PINTextField: UITextField {

    var isFilled: Bool {
        return self.pinNumber.count > 0
    }

    var pinNumber: String {
        return self.text ?? ""
    }
    
    var maxCharacterCount: Int = 1
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        setupStyle()
        inputAccessoryView = generateToolbar()
    }
    
    private func setupStyle(){
        self |> Design.whiteRoundedTextField
    }
    
    override func deleteBackward() {
        super.deleteBackward()
        (self.delegate as? PinCodeTextFieldProtocol)?.didPressBackspace(textField: self)
    }
    
    func generateToolbar() -> UIToolbar {
        let toolbar =  UIToolbar(frame: CGRect(x: 0.0, y: 0.0, width: UIScreen.main.bounds.width, height: 44.0))
        let item1 = UIBarButtonItem(barButtonSystemItem:UIBarButtonItem.SystemItem.flexibleSpace , target: nil, action: nil)
        let item2 = UIBarButtonItem(title: "DONE", style: UIBarButtonItem.Style.plain, target: self, action: #selector(doneButtonDidPressed))
        toolbar.setItems([item1, item2], animated: false)
        return toolbar
    }
    
    @objc func doneButtonDidPressed() {
        self.resignFirstResponder()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
