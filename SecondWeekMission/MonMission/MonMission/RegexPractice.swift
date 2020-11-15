import Foundation

struct FilterCharacter {
    var examine = (alphabet: true, number: true, specialCharacter: true, limitLength: true)
    let alphabets = CharacterSet.letters
    let numbers = CharacterSet.decimalDigits
    let specialCharacters = CharacterSet(charactersIn: "*[!@#$%^*()-_=+|[]{};:',.<>/?]")
    let limitLength = 8
    
    private func isCharacterCount(for ID: String) -> Bool {
        return ID.count >= 5 && ID.count < 24
    }
    
    private func isUnicodeAndNumber(for ID: String) -> Bool {
        var filterSet = CharacterSet.letters
        filterSet.insert(charactersIn: "-0123456789")
        return ID.rangeOfCharacter(from: filterSet) != nil ? true : false
    }
    
    private func isThreeNonContinued(for ID: String) -> Bool {
        let tempArr = Array(ID)
        for index in 2..<tempArr.count {
            if tempArr[index - 2] == tempArr[index - 1] && tempArr[index - 1] == tempArr[index] && tempArr[index - 0] == tempArr[index - 2] {
                return false
            }
        }
        return true
    }
    
    private func isThreeNonConsecutiveNumbers (for ID: String) -> Bool {
        let consecutiveNumberArr = ["123", "234", "345", "456", "567", "678", "789", "890", "901", "012"]
        for compareValue in consecutiveNumberArr {
            if ID.contains(compareValue) {
                return false
            }
        }
        return true
    }
    
    func IDValidator(ID: String) -> Bool {
        return isCharacterCount(for: ID) && isUnicodeAndNumber(for: ID) && isThreeNonContinued(for: ID) && isThreeNonConsecutiveNumbers(for: ID)
    }
    
    func deriveLevel(password: String) -> Int {
        // alphabet, number, specialCharacter, limitLength
        switch examine {
        case (false, true, false, false):
            return 1
        case (true, false, false, false):
            return 2
        case (true, true, true, false):
            return 4
        case (true, true, true, true):
            return 5
        default:
            return 3
        }
    }
    
    mutating func examinePassword(password: String) -> Int {
        if password.rangeOfCharacter(from: alphabets) == nil {
            examine.alphabet = false
        }
        if password.rangeOfCharacter(from: numbers) == nil {
            examine.number = false
        }
        if password.rangeOfCharacter(from: specialCharacters) == nil {
            examine.specialCharacter = false
        }
        if password.count < 8 {
            examine.limitLength = false
        }
        print(examine)
        return deriveLevel(password: password)
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
}
