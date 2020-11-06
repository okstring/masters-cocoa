//
//  p1000.swift
//  Friday-algorithm
//
//  Created by Maylily on 2020/11/06.
//

import Foundation

func p1000() {
    let input = readLine()!
    let convertArr = input.split(separator: " ")
    let output = Int(convertArr[0])! + Int(convertArr[1])!
    print(output)
}
