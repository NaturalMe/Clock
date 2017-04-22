//
//  StringExtension.swift
//  Clock
//
//  Created by 张润良 on 2017/4/22.
//  Copyright © 2017年 Zhangrunliang. All rights reserved.
//

import Foundation

extension String {
    
    func isZero() -> Bool {
        if self == "00" {
            return true
        }
        return false
    }
    
    func isSingle() -> Bool {
        if self.characters.first == "0" {
            return true
        }
        return false
    }
    
    mutating func removeSingle() {
        self.remove(at: self.startIndex)
    }
    
}
