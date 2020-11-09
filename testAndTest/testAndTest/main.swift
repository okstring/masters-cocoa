//
//  main.swift
//  testAndTest
//
//  Created by Maylily on 2020/11/04.
//

import Foundation

//var str = "1234"
//
//var arr = ["123", "234", "345", "456", "567", "678", "789", "890", "901", "012"]
//for compareValue in arr {
//    print(str.contains(compareValue))
//}

//
//func isPossibleCharacter (str: String) -> Bool {
//    let pattern = "[A-Za-z0-9\\-]{5,23}" // 8앞의 숫자 3개 --> 567 밖에 없다.
//    let regex = try! NSRegularExpression(pattern:pattern, options:[])
//    let range = NSRange(location: 0, length: str.utf16.count)
//    let n = regex.firstMatch(in: str, options: [], range: range)
//    if n == nil {
//        return false
//    }
//    return true
//}
//
//func isThreeduplicateNumbers(str: String) -> Bool {
//    let pattern = "[1]{3}|[2]{3}|[3]{3}|[4]{3}|[5]{3}|[6]{3}|[7]{3}|[8]{3}|[9]{3}|[0]{3}"
//    let regex = try! NSRegularExpression(pattern:pattern, options:[])
//    let range = NSRange(location: 0, length: str.utf16.count)
//    let n = regex.firstMatch(in: str, options: [], range: range)
//    if n == nil {
//        return true
//    }
//    return false
//}
//
//print(isThreeduplicateNumbers(str: "asdf"))


let str = "abcde"
//print(str[0]) // 'subscript(_:)' is unavailable: cannot subscript String with an Int, use a String.Index instead.
print(str[str.startIndex])
//print(str[str.endIndex]) // String index is out of bounds

let endIndex = str.index(before: str.endIndex) // before - 1, after + 1
print(str[endIndex])

let startIndex = str.index(str.startIndex, offsetBy: 2) // 세 번째 숫자
print(str[startIndex])


