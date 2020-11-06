//
//  p1008.swift
//  Friday-algorithm
//
//  Created by Maylily on 2020/11/06.
//

import Foundation

func p1008() {
    let input = readLine()!
    let convertArr = input.split(separator: " ")
    let result = Double(convertArr[0])! / Double(convertArr[1])!
    print(result)
}
