//
//  File.swift
//  
//
//  Created by 최형우 on 2022/01/03.
//

import Foundation
import RxSwift

public extension Observable where Element == String{
    func regex(_ pattern: String,_ options: NSRegularExpression.Options = []) -> Observable<Bool>{
        do {
            return map {
                let regex = try NSRegularExpression(pattern: pattern, options: options)
                if let _ = regex.firstMatch(in: $0, options: [], range: NSRange(location: 0, length: $0.count)){
                    return true
                }
                return false
            }
        }
        
    }
}
