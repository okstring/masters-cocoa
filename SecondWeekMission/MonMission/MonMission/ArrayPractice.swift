import Foundation

struct ArrayPractice {
    typealias resultArrayInAny = Array<Array<Any>>
    typealias resultArrayInBool = Array<Array<Bool>>
    typealias resultArrayInInt = Array<Array<Int>>

    var arrayInInt = Array<Array<Int>>()
    var arrayInString = Array<Array<String>>()
    var arrayInBool = Array<Array<Bool>>()
    
    mutating func fillArray() -> resultArrayInInt {
        for (roofCountInRow, startNum) in stride(from: 1, through: 21, by: 5).enumerated() {
            arrayInInt.append(Array<Int>(startNum...startNum + roofCountInRow))
        }
        return arrayInInt
    }
    
    mutating func setBoolArray() -> resultArrayInBool {
        arrayInBool = Array(repeating: Array(repeating: false, count: 7), count: 7)
        for rowIndex in 0...6 {
            for insertTrueIndex in 6 - rowIndex...6 {
                arrayInBool[rowIndex][insertTrueIndex] = true
            }
        }
        return arrayInBool
    }
    
    mutating func makeMagicSquare(row: Int) -> resultArrayInInt{
        arrayInInt = Array(repeating: Array(repeating: 0, count: row), count: row)
        var rowIndex = Int.random(in: (0...row - 1))
        var colIndex: Int
        if row == 5 {
            colIndex = rowIndex - 3
            if colIndex < 0 {
                colIndex = 5 + colIndex
            }
            var num = 1
            while num <= 25 {
                arrayInInt[rowIndex][colIndex] = num
                if num % 5 == 0 {
                    rowIndex += 1
                    if rowIndex == 5 { rowIndex = 0 }
                    num += 1
                    continue
                }
                rowIndex -= 1
                colIndex += 1
                if rowIndex == -1 { rowIndex = 4 }
                if colIndex == 5 { colIndex = 0 }
                num += 1
            }
        }
        else {
            if rowIndex == 0 {
                colIndex = row - 1
            } else {
                colIndex = rowIndex - 1
            }
            var num = 1
            while num <= row * row {
                arrayInInt[rowIndex][colIndex] = num
                if num % row == 0 {
                    rowIndex -= 1
                } else {
                    rowIndex += 1
                    colIndex -= 1
                }
                if rowIndex == row { rowIndex = 0 }
                if rowIndex == -1 { rowIndex = row - 1 }
                if colIndex == -1 { colIndex = row - 1 }
                num += 1
            }
        }
        return arrayInInt
    }
    
    mutating func printArray(array: resultArrayInAny, newChar: String = "") {
        if newChar != "" {
            arrayInString = Array(repeating: Array(repeating: " ", count: 7), count: 7)
            for (rowIndex, row) in array.enumerated() {
                for (colIndex, colValue) in (row.enumerated()) {
                    if colValue as! Bool == true {
                        arrayInString[rowIndex][colIndex] = newChar
                    }
                }
                print(arrayInString[rowIndex].joined())
            }
        } else {
            for row in array {
                print(row)
            }
        }
    }
    
    func printMagicSquare(array: Array<Array<Int>>) {
        for row in array {
            print(row.map{
                if String($0).count == 1 {
                    return " " + String($0) + " "
                } else {
                    return String($0) + " "
                }
            }.joined())
        }
    }
}
