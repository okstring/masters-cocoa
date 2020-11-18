import Foundation

extension String {
    func toDouble() -> Double {
        return (self as NSString).doubleValue
    }
}

struct Stack<T> {
    var items = Array<T>()
    
    func isEmpty() -> Bool {
        return items.isEmpty
    }
    
    mutating func push(_ element: T) {
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
    
    mutating func reset() {
        self.items.removeAll()
    }
}

struct Calcurator {
    enum Symbols {
        case plus, minus, multiple, divide, equal
    }
    let formatter = NumberFormatter()
    init() {
        formatter.numberStyle = .decimal
        formatter.maximumSignificantDigits = 18
    }
    
    var currentNumber: String = ""
    var displayNumber: String {
        guard let value = formatter.string(for: currentNumber.toDouble()) else {
            return ""
        }
        return value
    }
    var value: String = ""
    
    var sign: Symbols? = nil
    var beforeSign: Symbols? = nil
    var stack = Stack<String>()
    
    mutating func calculation(sign: Symbols, before: Double, current: Double) -> String {
        switch sign {
        case .plus:
            if let value = formatter.string(for: (before + current)) {
                stack.push(value)
            }
        case .minus:
            if let value = formatter.string(for: (before - current)) {
                stack.push(value)
            }
        case .multiple:
            if let value = formatter.string(for: (before * current)) {
                stack.push(value)
            }
        case .divide:
            if let value = formatter.string(for: (before / current)) {
                stack.push(value)
            }
        default:
            break
        }
        
        guard let result = stack.peek() else { return "0" }
        return result
    }
    
    
    mutating func interCalculation(sign: Symbols) -> String {
        let current = (currentNumber as NSString).doubleValue
        var result: String
        
        // 처음 계산하는 수
        guard beforeSign != nil else {
            beforeSign = sign
            if let value = formatter.string(for: current) {
                stack.push(value)
            }
            currentNumber = ""
            
            guard let result = stack.peek() else { return "0" }
            
            return result
        }
        
        // 계속 계산하는 수
        if stack.peek() != nil && beforeSign != nil && sign != .equal {
            let before = stack.pop() ?? "0"
            let beforeDouble = (before as NSString).doubleValue
            result = calculation(sign: sign, before: beforeDouble, current: current)
            
            beforeSign = sign
            currentNumber = ""
            
            return result
            
        // equal
        } else if sign == .equal {
            if let lastSign = beforeSign {
                let before = stack.pop() ?? "0"
                let beforeDouble = (before as NSString).doubleValue
                result = calculation(sign: lastSign, before: beforeDouble, current: current)
                
                beforeSign = nil
                currentNumber = ""
                
                return result
            }
        }
        return "0"
    }
}

