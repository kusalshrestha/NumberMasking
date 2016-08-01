//
//  PhoneNumberFormatter.swift
//  MaskNumber
//
//  Created by Kusal Shrestha on 6/9/16.
//  Copyright © 2016 Kusal Shrestha. All rights reserved.
//

import Foundation

enum TextFieldAction: Int {
    case Insert, Delete
}

class PhoneNumberFormatter: NSNumberFormatter {
    
    func StringFromNumberWithExample(number: NSNumber, exampleString string: String) -> String? {
        let numberString = String(number)
        let nums = Array(numberString.characters)
        guard numberFromString(string) == nil else {
            return string
        }
        var exampStringIterator = -1
        var charIterator = 0
        
        let modifiedArray = string.characters.map { (char) -> String in
            charIterator = charIterator + 1
            if charIterator <= nums.count {
                char.hashValue
                if char == "*" {
                    exampStringIterator = exampStringIterator + 1
                    if exampStringIterator < nums.count {
                        return String(nums[exampStringIterator])
                    }
                    return ""
                }
                charIterator = charIterator - 1
                return String(char)
            }
            return ""
        }
        let finalString = String(modifiedArray.flatMap{$0.characters})
        
        return finalString
    }
    
}
