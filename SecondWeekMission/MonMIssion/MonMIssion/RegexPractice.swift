import Foundation

struct RegexPractice {
    func isPossibleCharacter (str: String) -> Bool {
        let pattern = "[A-Za-z0-9\\-]{5,23}"
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
        guard isPossibleCharacter(str: password) else {
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
    
    func isVeryWeakPassword(password: String) -> Bool {
        let pattern = "^[0-9]{0,7}$"
        let regex = try! NSRegularExpression(pattern:pattern, options:[])
        let range = NSRange(location: 0, length: password.utf16.count)
        let n = regex.firstMatch(in: password, options: [], range: range)
        if n == nil {
            return false
        }
        return true
    }
    
    func isWeakPassword(password: String) -> Bool {
        let pattern = "^[A-Za-z]{0,7}$"
        let regex = try! NSRegularExpression(pattern:pattern, options:[])
        let range = NSRange(location: 0, length: password.utf16.count)
        let n = regex.firstMatch(in: password, options: [], range: range)
        if n == nil {
            return false
        }
        return true
    }
    
    func isStrongPassword(password: String) -> Bool {
        let pattern = "^(?=.*[0-9])(?=.*[A-Za-z])[A-Za-z0-9]{8,}$"
        let regex = try! NSRegularExpression(pattern:pattern, options:[])
        let range = NSRange(location: 0, length: password.utf16.count)
        let n = regex.firstMatch(in: password, options: [], range: range)
        if n == nil {
            return false
        }
        return true
    }
    
    func isVeryStrongPassword(password: String) -> Bool {
        let pattern = "^((?=.*[0-9])(?=.*[A-Za-z])(?=.*[\\!\\@\\#\\$\\%\\^\\*\\(\\)\\-\\_\\=\\+\\|\\[\\]\\{\\}\\;\\:\\'\"\\,\\.\\<\\>\\/\\?])).{8,}$"
        let regex = try! NSRegularExpression(pattern:pattern, options:[])
        let range = NSRange(location: 0, length: password.utf16.count)
        let n = regex.firstMatch(in: password, options: [], range: range)
        if n == nil {
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
        if isVeryWeakPassword(password: password) {
            return 1
        } else if isWeakPassword(password: password) {
            return 2
        } else if isStrongPassword(password: password) {
            return 4
        } else if isVeryStrongPassword(password: password) {
            return 5
        } else {
            return 3
        }
    }
}
