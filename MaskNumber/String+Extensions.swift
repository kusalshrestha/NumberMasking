//
//  String+Extensions.swift
//  MaskNumber
//
//  Created by Kusal Shrestha on 6/9/16.
//  Copyright © 2016 Kusal Shrestha. All rights reserved.
//

import Foundation

extension String {
    
    func insertString(string: String, index: Int) -> String {
        if index >= 0 && index <= self.characters.count {
            return String(self.characters.prefix(index)) + string + String(self.characters.suffix(self.characters.count - index))
        }
        return self
    }
    
    func removeStringAtIndex(index: Int) -> String {
        if index > 0 && index <= self.characters.count {
            return String(self.characters.prefix(index - 1)) + String(self.characters.suffix(self.characters.count - index))
        }
        return self
    }
    
}
