import Foundation

struct CheckPassword {

    var examine = (alphabet: true, number: true, specialCharacter: true, limitLength: true)
    let alphabets = CharacterSet.letters
    let numbers = CharacterSet.decimalDigits
    let specialCharacters = CharacterSet(charactersIn: "*[!@#$%^*()-_=+|[]{};:',.<>/?]")
    let limitLength = 8
    
    
    func deriveLevel(password: String) -> Int {
        switch examine {
        case (false, false, true, false):
            return 1
        case (false, true, false, false):
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
    
    func makePartStrongPassword() -> String {
        let randomStrings = ["abcdefghijklmnopqrstuvwxyzABCDEFGHIJKLMNOPQRSTUVWXYZ", "0123456789", "!@#$%^*()-_=+|[]{};:'\",.<>/?"]

        // 8 ~ 10자 사이 글자를 문자, 숫자, 특수문자 Array 중 랜덤하게 골라 리턴
        return String((0...Int.random(in: 8...10)).map { _ in
            guard let character = randomStrings[Int.random(in: 0...2)].randomElement() else {
                return Character("-")
            }
            return character
        })
    }
    func makeStrongPassword() -> String {
        return makePartStrongPassword() + "-" + makePartStrongPassword()
    }
    
//    func deriveLevel(password: String) -> Int {
//        if isRegexFirstMatch(str: password, pattern: veryWeakPasswordPattern) {
//            return 1
//        } else if isRegexFirstMatch(str: password, pattern: weakPasswordPattern) {
//            return 2
//        } else if isRegexFirstMatch(str: password, pattern: strongPasswordPattern) && !isRegexFirstMatch(str: password, pattern: veryStrongPasswordPattern){
//            return 4
//        } else if isRegexFirstMatch(str: password, pattern: veryStrongPasswordPattern) {
//            return 5
//        } else {
//            return 3
//        }

    
    
//    let possibleCharacterPattern = "[A-Za-z0-9\\-]{5,23}"
//    let veryWeakPasswordPattern = "^[0-9]{0,7}$"
//    let weakPasswordPattern = "^[A-Za-z]{0,7}$"
//    let strongPasswordPattern = "^(?=.*[0-9])(?=.*[A-Za-z])[A-Za-z0-9]{8,}$"
//    let veryStrongPasswordPattern = "^((?=.*[0-9])(?=.*[A-Za-z])(?=.*[\\\\\\!\\@\\#\\$\\%\\^\\*\\(\\)\\-\\_\\=\\+\\|\\[\\]\\{\\}\\;\\:\\'\"\\,\\.\\<\\>\\/\\?])).{8,}$"
//
//    let alph
//
//    func isRegexFirstMatch(str: String, pattern: String) -> Bool {
//        let pattern = pattern
//        let regex = try! NSRegularExpression(pattern:pattern, options:[])
//        let range = NSRange(location: 0, length: str.utf16.count)
//        let n = regex.firstMatch(in: str, options: [], range: range)
//        if n == nil {
//            return false
//        }
//        return true
//    }
//
//    func deriveLevel(password: String) -> Int {
//        if isRegexFirstMatch(str: password, pattern: veryWeakPasswordPattern) {
//            return 1
//        } else if isRegexFirstMatch(str: password, pattern: weakPasswordPattern) {
//            return 2
//        } else if isRegexFirstMatch(str: password, pattern: strongPasswordPattern) && !isRegexFirstMatch(str: password, pattern: veryStrongPasswordPattern){
//            return 4
//        } else if isRegexFirstMatch(str: password, pattern: veryStrongPasswordPattern) {
//            return 5
//        } else {
//            return 3
//        }
//    }
//
}
