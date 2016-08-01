//
//  ViewController.swift
//  MaskNumber
//
//  Created by Kusal Shrestha on 6/9/16.
//  Copyright © 2016 Kusal Shrestha. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet var textField: UITextField!
    let numFormatter = PhoneNumberFormatter()
    var totalNumber = ""
    let exampleString = "(***) ***-****"
    var exampleArray: [String] = []
    var numbersInExampleStringCount = 0
    
    override func viewDidLoad() {
        super.viewDidLoad()
    
        textField.delegate = self
//        exampleArray = Array(exampleString.characters)
        numbersInExampleStringCount = exampleString.characters.filter{($0 == "*")}.count
    }

}

extension ViewController: UITextFieldDelegate {
    
    func textField(textField: UITextField, shouldChangeCharactersInRange range: NSRange, replacementString string: String) -> Bool {

        switch TextFieldAction(rawValue: range.length)! {
        case .Insert:
            if numbersInExampleStringCount > totalNumber.characters.count {
                if let _ = Double(string) {
                    totalNumber = totalNumber + string
                    if let number = Double(totalNumber) {
                        textField.text = updateString(number, string: exampleString)!
                    }
                }
            }
            return false
            
        case .Delete:
            totalNumber = String(totalNumber.characters.dropLast())
            if let number = Double(totalNumber) {
                textField.text = updateString(number, string: exampleString)!
                return false
            }
            return true
        }
        
    }
    
    private func updateString(number: Double, string: String) -> String? {
        return numFormatter.StringFromNumberWithExample(number, exampleString: exampleString)
    }
    
    private func getNearestNumberIndex(cursorIndex: Int, ofTextField textField: UITextField) -> Int {
        return 0
    }
    
}

