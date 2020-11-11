import Foundation

struct CheckPassword {
    let possibleCharacterPattern = "[A-Za-z0-9\\-]{5,23}"
    let veryWeakPasswordPattern = "^[0-9]{0,7}$"
    let weakPasswordPattern = "^[A-Za-z]{0,7}$"
    let strongPasswordPattern = "^(?=.*[0-9])(?=.*[A-Za-z])[A-Za-z0-9]{8,}$"
    let veryStrongPasswordPattern = "^((?=.*[0-9])(?=.*[A-Za-z])(?=.*[\\\\\\!\\@\\#\\$\\%\\^\\*\\(\\)\\-\\_\\=\\+\\|\\[\\]\\{\\}\\;\\:\\'\"\\,\\.\\<\\>\\/\\?])).{8,}$"
    
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
    
    func deriveLevel(password: String) -> Int {
        if isRegexFirstMatch(str: password, pattern: veryWeakPasswordPattern) {
            return 1
        } else if isRegexFirstMatch(str: password, pattern: weakPasswordPattern) {
            return 2
        } else if isRegexFirstMatch(str: password, pattern: strongPasswordPattern) && !isRegexFirstMatch(str: password, pattern: veryStrongPasswordPattern){
            return 4
        } else if isRegexFirstMatch(str: password, pattern: veryStrongPasswordPattern) {
            return 5
        } else {
            return 3
        }
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
}
