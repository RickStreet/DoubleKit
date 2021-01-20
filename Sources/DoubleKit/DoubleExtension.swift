//
//  File.swift
//  
//
//  Created by Rick Street on 1/17/20.
//

import Foundation
import StringKit

public extension Double {
    
    /// Round Double to significant digits
    /// - Parameter digits: number of digits to round to.
    func roundTo(digits:Int) -> Double {
        guard self != 0.0 else {
            return 0
        }
        let divisor = pow(10.0, Double(digits) - ceil(log10(fabs(self))))
        return (self * divisor).rounded() / divisor
    }
    
    func roundTo(decimals: Int) -> Double {
        let divisor = pow(10.0, Double(decimals))
        return (self * divisor).rounded() / divisor
    }
    
    var precisionString: String {
        if self == 0 {
            return "0"
        } else {
            var decimals = 0
            let size = Int(log10(abs(self)))
            if size > 0 {
                decimals = 15 - size
            } else {
                decimals = 16 - size
            }
            return  String(format: "%.\(decimals)f", self)
        }
    }

}

/*
public extension Optional where Wrapped == Double {
    var stringValue: String {
        get {
            guard let unwrapped = self else {
                return ""
            }
            return String(unwrapped)
        }
        set {
            self = newValue.doubleValue
        }
    }
}
*/
