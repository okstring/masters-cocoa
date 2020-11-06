//
//  p2920.swift
//  Friday-algorithm
//
//  Created by Maylily on 2020/11/06.
//

import Foundation

func p2920() {
    let input = readLine()!
    let scalesStr = input.split(separator: " ").joined()
    switch scalesStr {
    case "12345678":
        print("ascending")
    case "87654321":
        print("descending")
    default:
        print("mixed")
    }
}
