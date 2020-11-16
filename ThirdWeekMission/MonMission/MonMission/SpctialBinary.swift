import Foundation

struct SpctialBinary {
    var values = Array<String>()
    
    init (with total: Int) {
        values = Array(repeating: String(total, radix: 2), count: total)
        print(value)
    }
    
    
}
