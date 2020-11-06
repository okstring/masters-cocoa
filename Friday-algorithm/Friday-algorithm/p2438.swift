//
//  p2438.swift
//  Friday-algorithm
//
//  Created by Maylily on 2020/11/06.
//

import Foundation

func p2438() {
    let input = readLine()!
    for numberOfStar in 1...Int(input)! {
        print(String(repeating: "*", count: numberOfStar))
    }
}
