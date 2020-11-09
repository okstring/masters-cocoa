import Foundation

//미션1. printXY()
func printXY(max: Int) {
    for _ in 1...max {
        print()
        for j in 1...max {
            print(j, terminator: " ")
        }
    }
}
//
//printXY(max: 3)
//printXY(max: 5)


//미션2. printLeftTree()
func printLeftTree(lines: Int) {
    var num = 1
    while num <= lines {
        print()
        for _ in 1...num {
            print("🎈", terminator: "")
        }
        num += 1
    }
}

//printLeftTree(lines: 5)


// 미션3. printRightTree()
func printRightTree(lines: Int) {
    var spaceNum = lines - 1
    var printNum = 1
    while printNum <= lines {
        if spaceNum >= 1 {
            for _ in 1...spaceNum { print(" ", separator: "", terminator: "") }
        }
        for _ in 1...printNum {
            print("🎈", terminator: "")
        }
        print()
        printNum += 1
        spaceNum -= 1
    }
}

//printRightTree(lines: 4)


//미션4. printCenterTree()
func printCenterTree(lines: Int) {
    var spaceNum = lines - 1
    var printNum = 1
    var centerSpaceCount: Int
    
    while printNum <= lines {
        centerSpaceCount = printNum - 1
        
        if spaceNum >= 1 {
            for _ in 1...spaceNum { print(" ", terminator: "") }
        }
        for _ in 1...printNum {
            print("🎈", separator: "", terminator: "")
            if centerSpaceCount >= 1 { print(" ", terminator: "") }
        }
        print()
        printNum += 1
        spaceNum -= 1
    }
}

printCenterTree(lines: 5)


// 미션5. printNumbers()
func printNumbers(lines: Int) {
    let numInLine = Array<Int>(1...lines)
    let maxNum = numInLine.reduce(0, {$0 + $1})

    let spaceCountNum = String(maxNum).count
    var frontSpace = ""
    if spaceCountNum >= 1 {
        for _ in 1...spaceCountNum { frontSpace += " " }
    }
    
    var printNum = 1
    while printNum <= maxNum {
        for line in numInLine {
            for _ in 1...line {
                if String(printNum).count != String(printNum - 1).count {
                    frontSpace.removeLast()
                }
                print(frontSpace, terminator: "")
                print(printNum, terminator: "")
                printNum += 1
            }
            print()
        }
    }
}

//printNumbers(lines: 5)


// 미션5. printSquare()
func printSquare(columns: Int) {
    let maxNum = 25
    var num = 1
    var result = ""
    while num <= maxNum {
        if String(num).count == 1 { result += " " }
        if num % columns == 0 && String(num).count == 1 {
            result.removeLast()
            result += String(num) + "\n"
            num += 1
            continue
        } else if num % columns == 0 {
            result += String(num) + "\n"
            num += 1
            continue
        }
        result += String(num) + " "
        num += 1
    }
    print(result)
}

//printSquare(columns: 5)


// 미션5. printReverse()
func printReverse(lines: Int) {
    var numFirst: Int
    var numLast: Int
    var reverseNumFirst: Int
    var reverseNumLast: Int
    
    for i in 1...lines {
        if i % 2 == 0 {
            reverseNumFirst = lines * i
            reverseNumLast = reverseNumFirst - lines + 1
            
            for printNum in stride(from: reverseNumFirst, through: reverseNumLast, by: -1) {
                print(printNum, terminator: " ")
            }
            print()
        } else {
            numLast = lines * i
            numFirst = numLast - lines + 1
            
            for printNum in numFirst...numLast {
                print(printNum, terminator: " ")
            }
            print()
        }
    }
}

//printReverse(lines: 4)


// 미션6. printDiamon()
func printDiamond(lines: Int) {
    var space: Int
    var result = ""
    var maxPrintStar: Int
    
    for line in 1...lines / 2 {
        space = lines / 2 + 1 - line
        if space >= 1 {
            for _ in 1...space { result += " " }
        }
        if lines % 2 == 0 { result.removeLast() }
        
        maxPrintStar = line * 2 - 1
        for printCount in 1...maxPrintStar {
            if printCount == maxPrintStar {
                result += "*\n"
                continue
            }
            result += "*"
        }
    }
    
    if lines % 2 == 1 {
        for printCount in 1...lines {
            if printCount == lines {
                result += "*\n"
                continue
            }
            result += "*"
        }
    }
    
    for line in stride(from: lines / 2, through: 1, by: -1) {
        space = lines / 2 + 1 - line
        if space >= 1 {
            for _ in 1...space {
                result += " "
            }
        }
        if lines % 2 == 0 { result.removeLast() }
        
        maxPrintStar = line * 2 - 1
        for printCount in 1...maxPrintStar {
            if printCount == maxPrintStar {
                result += "*\n"
                continue
            }
            result += "*"
        }
    }
    print(result)
}

//printDiamond(lines: 6)


// 미션7. print3515()
func print3515(lines: Int) -> Array<String> {
    var result: [String] = []

    for num in 1...lines {
        if num % 15 == 0 { result.append("👏🏼🙏") }
        else if num % 3 == 0 { result.append("👏🏼") }
        else if num % 5 == 0 { result.append("🙏") }
        else { result.append(String(num)) }
    }
    return result
}

//print(print3515(lines: 15))


// 미션7 2차원 배열???
//func print3515(lines: Int) -> [[String]] {
//    var result = [[String]](repeating: Array(repeating: "", count: 1), count: 15)
//    var num: Int
//    for (index, _) in result.enumerated() {
//        num = index + 1
//        if num % 15 == 0 { result[index][0] = "👏🏼🙏" }
//        else if num % 3 == 0 { result[index][0] = "👏🏼" }
//        else if num % 5 == 0 { result[index][0] = "🙏" }
//        else { result[index][0] = String(num) }
//    }
//    return result
//}

//print(print3515(lines: 15))

