//
//  String.swift
//  InternetFamous
//
//  Created by 北川 on 2024/12/17.
//

import Foundation

extension String {
    
    func strDistence(str: String) -> Int {
        guard let range = self.range(of: str) else { return -1 }
        return distance(from: self.startIndex, to: range.lowerBound)
    }
    
}
