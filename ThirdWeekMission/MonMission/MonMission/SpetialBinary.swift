import Foundation

extension String {
    func digitMatching(to count: Int) -> String {
        if self.count < count {
            return String(repeating: "0", count: count - self.count) + self
        }
        return self
    }
}

struct SpecialBinary {
    private var values = Array<String>()
    init (with total: Int) {
        for num in 0..<Int(pow(2.0, Double(total))){
            values.append(String(num, radix: 2).digitMatching(to: total))
//            values.append(String(format: "%.\(total)d", (String(3, radix: 2) as NSString).integerValue))
        }
    }
    var count: Int {
        return values.count
    }
    func find(by bitcount: Int) -> Array<String> {
        return values.filter({ $0.components(separatedBy: "0").joined().count == bitcount })
    }
}
