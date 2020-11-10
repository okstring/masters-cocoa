import Foundation

struct OtherMission {
    func antFunction(inputArray: Array<Int>) -> Array<Int> {
        var previousNum = 0
        var previousCount = 0
        var resultArr = Array<Int>()
        for (index, value) in inputArray.enumerated() {
            if index == 0 {
                previousNum = inputArray[0]
                previousCount = 0
            }
            if previousNum == value {
                previousCount += 1
                if index == inputArray.endIndex - 1 {
                    resultArr.append(previousNum)
                    resultArr.append(previousCount)
                }
            } else {
                resultArr.append(previousNum)
                resultArr.append(previousCount)
                if index == inputArray.endIndex - 1 {
                    resultArr.append(value)
                    resultArr.append(1)
                    break
                }
                previousNum = value
                previousCount = 1
            }
        }
        return resultArr
    }
    
    func duplicatedWords(inputWords: Array<String>) -> Array<String> {
        var countValueDict: [String:Int] = [:]
        for value in inputWords {
            countValueDict[value, default: 0] += 1
        }
        return Array(countValueDict.filter({ $0.value >= 2 }).keys)
    }
}
