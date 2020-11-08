import Foundation

struct Mission {
    typealias resultArray = Array<Array<String>>
    
    func printXY(lines: Int) -> resultArray {
        let eachRowArr = Array(stride(from: 1, through: lines, by: 1)).map({String($0) + " "})
        let resultArr = Array(repeating: eachRowArr, count: lines)
        return resultArr
    }
    
    func printLeftTree(lines: Int) -> resultArray {
        var resultArr = Array(repeating: Array(repeating: "", count: lines), count: lines)
        for rowIndex in 0..<lines {
            for balloonCount in 0...rowIndex { resultArr[rowIndex][balloonCount] = "🎈" }
        }
        return resultArr
    }
    
    func printRightTree(lines: Int) -> resultArray {
        var resultArr = Array(repeating: Array(repeating: "  ", count: lines), count: lines)
        for rowIndex in 0..<lines {
            for balloonCount in lines - 1 - rowIndex...lines - 1 {
                resultArr[rowIndex][balloonCount] = "🎈"
            }
        }
        return resultArr
    }
    
    func printCenterTree(lines:Int) -> resultArray {
        var resultArr = Array(repeating: Array(repeating: " ", count: lines * 2), count: lines)
        for row in 0..<lines {
            for untilDrawBalloon in stride(from: lines - 1 - row, through: lines + row, by: 2) {
                resultArr[row][untilDrawBalloon] = "🎈"
            }
        }
        return resultArr
    }
    
    func printNumbers(lines: Int) -> resultArray {
        var resultArr = Array(repeating: Array(repeating: "", count: lines), count: lines)
        let maxNum = Array<Int>(1...5).reduce(0, { $0 + $1 })
        var insertNum = 1
        for row in 0..<lines {
            for growNumber in 0...row {
                resultArr[row][growNumber] = String(repeating: " ", count: String(maxNum).count - String(insertNum).count) + String(insertNum) + " "
                insertNum += 1
            }
        }
        return resultArr
    }
    
    func printSquare(columns: Int) -> resultArray {
        let maxNum = 25
        var resultArr = Array(repeating: Array(repeating: "", count: columns), count: maxNum / columns + 1)
        var insertNum = 1
        for row in 0..<maxNum / columns + 1{
            for column in 0..<columns {
                if insertNum > maxNum { break }
                if insertNum % columns == 0 && String(insertNum).count == 1 {
                    resultArr[row][column] = String(insertNum) + "  "
                } else if String(insertNum).count == 1 {
                    resultArr[row][column] = " " + String(insertNum) + " "
                } else {
                    resultArr[row][column] = String(insertNum) + " "
                }
                insertNum += 1
            }
        }
        return resultArr
    }
    
    func printReverse(lines: Int) -> resultArray {
        var resultArr = Array<Array<String>>()
        for (index, startNum) in stride(from: 1, to: lines * lines, by: lines).enumerated() {
            if index % 2 == 0 {
                resultArr.append(Array<Int>(startNum..<startNum + lines).map({String($0) + " "}))
            } else {
                resultArr.append(Array<Int>(
                stride(from: startNum + lines - 1, through: startNum, by: -1)).map({String($0) + " "}))
            }
        }
        return resultArr
    }
    
    func printDiamond(lines: Int) -> resultArray {
        var resultArr = Array(repeating: Array(repeating: " ", count: lines), count: lines)
        let halfNum = Int(ceil(Float(lines) / 2))
        let evenOrOddKeyNum = ((lines % 2 == 0) ? 0 : 1)
        var row: Int
        for startIndex in stride(from: halfNum - 1, through: 0, by: -1) {
            for drawStarCount in 0..<(halfNum - startIndex) * 2 - 1 {
                row = halfNum - startIndex - 1
                resultArr[row][startIndex + drawStarCount] = "*"
            }
        }
        for startIndex in evenOrOddKeyNum...halfNum - 1 {
            for drawStarCount in 0..<(halfNum - startIndex) * 2 - 1 {
                row = halfNum + startIndex - evenOrOddKeyNum
                resultArr[row][startIndex + drawStarCount] = "*"
            }
        }
        return resultArr
    }
    
    func print3515(lines: Int) -> resultArray {
        var resultArr = Array(repeating: Array(repeating: "", count: 1), count: 15)
        var num: Int
        for (index, _) in resultArr.enumerated() {
            num = index + 1
            if num % 15 == 0 { resultArr[index][0] = "👏🏼🙏" }
            else if num % 3 == 0 { resultArr[index][0] = "👏🏼" }
            else if num % 5 == 0 { resultArr[index][0] = "🙏" }
            else { resultArr[index][0] = String(num) }
        }
        return resultArr
    }
    
    func printMission(resultArr: resultArray) {
        for row in resultArr {
            print(row.joined())
        }
    }
}

var mission = Mission()
let resultArrToPrint = mission.printDiamond(lines: 7)
mission.printMission(resultArr: resultArrToPrint)
