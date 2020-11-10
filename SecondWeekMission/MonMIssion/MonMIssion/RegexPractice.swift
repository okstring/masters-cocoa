import Foundation

struct RegexPractice {
    let possibleCharacterPattern = "[A-Za-z0-9\\-]{5,23}"
    let veryWeakPasswordPattern = "^[0-9]{0,7}$"
    let weakPasswordPattern = "^(?=.*[0-9])(?=.*[A-Za-z])[A-Za-z0-9]{8,}$"
    let strongPasswordPattern = "^(?=.*[0-9])(?=.*[A-Za-z])[A-Za-z0-9]{8,}$"
    let veryStrongPasswordPattern = "^((?=.*[0-9])(?=.*[A-Za-z])(?=.*[\\!\\@\\#\\$\\%\\^\\*\\(\\)\\-\\_\\=\\+\\|\\[\\]\\{\\}\\;\\:\\'\"\\,\\.\\<\\>\\/\\?])).{8,}$"
    
    func isRegexFirstMatch(str: String, pattern: String) -> Bool {
        let pattern = pattern
        let regex = try! NSRegularExpression(pattern:pattern, options:[])
        let range = NSRange(location: 0, length: str.utf16.count)
        let n = regex.firstMatch(in: str, options: [], range: range)
        if n == nil {
            return false
        }
        return true
    }
    
    func isThreeduplicateNumbers(str: String) -> Bool {
        let tempArr = Array(str)
        for index in 2..<tempArr.count {
            if tempArr[index - 2] == tempArr[index - 1] && tempArr[index - 1] == tempArr[index] && tempArr[index - 0] == tempArr[index - 2] {
                return false
            }
        }
        return true
    }
        
    func isThreeConsecutiveNumbers (str: String) -> Bool {
        let consecutiveNumberArr = ["123", "234", "345", "456", "567", "678", "789", "890", "901", "012"]
        for compareValue in consecutiveNumberArr {
            if str.contains(compareValue) {
                return false
            }
        }
        return true
    }
        
    func IDValidator(password: String) -> Bool {
        guard isRegexFirstMatch(str: password, pattern: possibleCharacterPattern) else {
            return false
        }
        guard isThreeduplicateNumbers(str: password) else {
            return false
        }
        guard isThreeConsecutiveNumbers(str: password) else {
            return false
        }
        return true
    }
    
    func isNationalIdectificationNumber(number: String) -> Bool {
        let keyArr = [2, 3, 4, 5, 6, 7, 8, 9, 2, 3, 4, 5]
        let inputNumberArr = Array(number).map({ String($0)})[..<12]
        let lastIndex = number.index(before: number.endIndex)
        let lastNum = Int(String(number[lastIndex]))
        var result: Int
        var sumEachNum: Int
        sumEachNum = inputNumberArr.enumerated().map{ (index, element) in
            return Int(element)! * keyArr[index]
        }.reduce(0, { $0 + $1 })
        result = (11 - (sumEachNum % 11)) % 10
        if lastNum == result {
            return true
        }
        return false
    }
    
    func passwordValidator(password: String) -> Int {
        if isRegexFirstMatch(str: password, pattern: veryWeakPasswordPattern) {
            return 1
        } else if isRegexFirstMatch(str: password, pattern: weakPasswordPattern) {
            return 2
        } else if isRegexFirstMatch(str: password, pattern: strongPasswordPattern) {
            return 4
        } else if isRegexFirstMatch(str: password, pattern: veryStrongPasswordPattern) {
            return 5
        } else {
            return 3
        }
    }
}
