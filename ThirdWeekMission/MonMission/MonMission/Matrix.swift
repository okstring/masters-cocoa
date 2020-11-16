import Foundation

class Matrix {
    var a: Double
    var b: Double
    var c: Double
    var d: Double
    
    init(a: Double = 0, b: Double = 0, c: Double = 0, d: Double = 0) {
        self.a = a
        self.b = b
        self.c = c
        self.d = d
    }
    
    func sum(with other: Matrix) -> Matrix {
        let result = Matrix()
        result.a = self.a + other.a
        result.b = self.b + other.b
        result.c = self.c + other.c
        result.d = self.d + other.d
        return result
    }
    
    func product(with other: Matrix) -> Matrix {
        let result = Matrix()
        result.a = self.a * other.a + self.b * other.c
        result.b = self.a * other.b + self.b * other.d
        result.c = self.c * other.a + self.d * other.c
        result.d = self.c * other.b + self.d * other.d
        return result
    }
}
