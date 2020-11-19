import Foundation

struct Stack<T> {
    private var items = [T]()
    
    func isEmpty() -> Bool {
        return items.isEmpty
    }
    
    mutating func push(_ element: T) {
        if let size = self.size() {
            if size > 6 { return }
        }
        self.items.append(element)
    }
    
    mutating func pop() -> T? {
        return items.popLast()
    }
    
    func peek() -> T? {
        return items.last
    }
    
    func size() -> Int? {
        return items.count
    }
}

// Ted, Hong, you've been very helpful
struct Bracket {
    enum Bracket: String {
        case round = "()", square = "[]", curly = "{}"
    }
    var paranthesisCaseArr: Array<String>
    
    init(paranthesis: Bracket) {
        paranthesisCaseArr = paranthesis.rawValue.map{ String($0) }
    }
    
    
    mutating func generate(with count:Int) -> Array<String> {
        
        var resultArr = Array<String>()
        
        if count == 1 {
            return [paranthesisCaseArr.joined()]
        }
        
        for number in 0..<((count - 1) * 2) * ((count - 1) * 2) {
            var result = ""
            let num = String(format: "%.4d", (String(number, radix: 2) as NSString).intValue)
            _ = num.map{
                if $0 == "0" { result += paranthesisCaseArr[0] }
                if $0 == "1" { result += paranthesisCaseArr[1] }
            }
            resultArr.append(paranthesisCaseArr[0] + result + paranthesisCaseArr[1])
        }
        
        let result = resultArr.filter{ value in
            value.components(separatedBy: paranthesisCaseArr[0]).joined().count == 3 &&
                value.components(separatedBy: paranthesisCaseArr[1]).joined().count == 3
        }
        
        return result.filter{ analyze(with: $0) }
    }
    
    mutating func analyze(with value: String) -> Bool {
        var stack = Stack<String>()
        let result = true
        for character in Array(value){
            if "\(character)" == paranthesisCaseArr[0] {
                stack.push("o")
            } else if stack.pop() != nil {
                return false
            }
        }
        return result
    }
}
