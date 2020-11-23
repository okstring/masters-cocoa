import Foundation

// https://www.geeksforgeeks.org/print-all-combinations-of-balanced-parentheses/
struct ParenthesisMatching {
    enum Bracket: String {
        case round = "()", square = "[]", curly = "{}"
    }
    var paranthesisCaseArr: Array<String>
    
    init(paranthesis: Bracket) {
        paranthesisCaseArr = paranthesis.rawValue.map{ String($0) }
    }
    
    var result = Array<String>()
    
    mutating func generate(with count: Int) -> Array<String> {
        var value = Array(repeating: "", count: count * 2)
        
        if (count > 0) {
            
            _generate(value: &value, index: 0, count: count, openCount: 0, closeCount: 0)
            
        }
        return result
    }
    
    mutating private func _generate(value: inout Array<String>, index: Int, count: Int, openCount: Int, closeCount: Int) {
        if (closeCount == count) {
            result.append(value.joined())
            return
            
        } else {
            
            if openCount > closeCount {
                
                value[index] = paranthesisCaseArr[1]
                _generate(value: &value, index: index + 1, count: count, openCount: openCount, closeCount: closeCount + 1)
                
            }
            if openCount < count {
                
                value[index] = paranthesisCaseArr[0]
                _generate(value: &value, index: index + 1, count: count, openCount: openCount + 1, closeCount: closeCount)
                
            }
        }
    }
    
    mutating func analyze(with value: String) -> Bool {
        
        let answerList = generate(with: value.components(separatedBy: paranthesisCaseArr[1]).count)
        return answerList.contains(value)
        
    }
    
}
