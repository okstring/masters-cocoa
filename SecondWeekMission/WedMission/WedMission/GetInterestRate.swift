import Foundation

struct GetInterestRate {
    private func getInterestRate(byDay: Int) -> Double {
        switch byDay {
        case let x where x <= 90: return 0.05
        case let x where x > 91 && x <= 180: return 0.1
        case let x where x > 181 && x < 364: return 0.2
        default: return 0.56
        }
    }
        
    func calculateAmount(day:Int, amount: Int) -> Double {
        return Double(amount) + (Double(amount) * (getInterestRate(byDay: day) / ( 365 / Double(day))))
    }
}
