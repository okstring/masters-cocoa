//
//  main.swift
//  MonMission
//
//  Created by Maylily on 2020/11/06.
//

import Foundation


// 미션1: inch를 cm로 바꾸는 함수
func convertToCM(fromInches: Float) -> Float {
    let resultCM = fromInches * 2.54
    return resultCM
}

print(convertToCM(fromInches: 50))
print(convertToCM(fromInches: 15))

// 미션2: cm를 inch로 바꾸는 함수
func convertToInches(fromCM: Float) -> Float {
    let resultInch = fromCM * 0.3937
    return resultInch
}

print(convertToInches(fromCM: 254))
print(convertToInches(fromCM: 75))

// 미션3: m를 inch로 바꾸는 함수
func convertToInches(fromMeter: Float) -> Float {
    let resultInch = fromMeter * 39.3701
    return resultInch
}

print(convertToInches(fromMeter: 1.5))
print(convertToInches(fromMeter: 0.4))


// 추가 미션을 위한 함수 추가 선언
func convertToMeter(fromCM: Float) -> Float{
    let resultMeter = fromCM / 100
    return resultMeter
}

func convertToCM(fromMeter: Float) -> Float {
    let resultCM = fromMeter * 100
    return resultCM
}

func matches(for regex: String, in text: String) -> String {
    do {
        let regex = try NSRegularExpression(pattern: regex)
        let results = regex.matches(in: text,
                                    range: NSRange(text.startIndex..., in: text))
        return results.map {
            String(text[Range($0.range, in: text)!])
        }.joined()
    } catch let error {
        print("invalid regex: \(error.localizedDescription)")
        return ""
    }
}


func unitConvert(unit: String) -> Float {
    let unitList = unit.split(separator: " ")
    let extractNum = Float(matches(for: "[0-9.]", in: String(unitList[0])))!
    var result = Float()
    
    if unitList.count == 2 {
        if unitList[0].contains("cm") && unitList[1].contains("inch") {
            result = convertToInches(fromCM: extractNum)
        } else if unitList[0].contains("inch") && unitList[1].contains("m") {
            let centimeterShame = convertToCM(fromInches: extractNum)
            result = convertToMeter(fromCM: centimeterShame)
        } else if unitList[0].contains("m") && unitList[1].contains("inch") {
            let centimeterShame = convertToCM(fromMeter: extractNum)
            result = convertToInches(fromCM: centimeterShame)
        }
    } else {
        if unit.contains("cm") {
            result = convertToMeter(fromCM: extractNum)
        } else if unit.contains("m"){
            result = convertToCM(fromMeter: extractNum)
        } else if unit.contains("inch") {
            result = convertToCM(fromInches: extractNum)
        }
    }
    return result
}

print(unitConvert(unit: "18cm inch"))
print(unitConvert(unit: "25.4inch m"))
print(unitConvert(unit: "0.5m inch"))
print(unitConvert(unit: "183cm"))
print(unitConvert(unit: "3.14m"))
print(unitConvert(unit: "2.54inch"))
