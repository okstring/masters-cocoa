import Foundation

class WatchBrain {
    private var month = 0
    private var day = 0
    private var hour = 0
    private var minutes = 0
    private var seconds = 0
    private var rawTag = 0
    private var units = ["", "일", "이", "삼", "사", "오", "육", "칠", "팔", "구", "십"]
    
    enum TimeType {
        case DayOrNight(Int)
        case Hour(Int)
        case Minute(Int)
        case Second(Int)
        case DayOrNightEmoji
        case none
    }
    
    var classifiedTag: TimeType {
        get {
            switch rawTag / 100 {
            case 1: return TimeType.DayOrNight(rawTag % 100)
            case 2: return TimeType.Hour(rawTag % 100)
            case 3: return TimeType.Minute(rawTag % 100)
            case 4: return TimeType.Second(rawTag % 100)
            default: return TimeType.none
            }
        }
    }
    
    func currntTime() {
        let date = Date()
        let calendar = NSCalendar.current
        
        hour = calendar.component(.hour, from: date)
        minutes = calendar.component(.minute, from: date)
        seconds = calendar.component(.second, from: date)
    }
    
    func isThisLableCurrentTime(_ tag: Int) -> Bool {
        rawTag = tag
        currntTime()
        
        switch classifiedTag {
        case .DayOrNight(let value): return isDayOrNightNow(value)
        case .Hour(let value): return isCorrectHour(value)
        case .Minute(let value): return isCorrectMinute(value)
        default: break
        }
        return false
    }
    
    func isDayOrNightNow(_ value: Int) -> Bool {
        switch value {
        case 0: return true
        case 1: return hour >= 0 && hour <= 12 ? true : false
        case 2: return hour >= 13 && hour <= 23 ? true : false
        default: break
        }
        return false
    }
    
    func isCorrectHour(_ value: Int) -> Bool {
        switch value {
        case 20: return true
        case 0: return hour % 12 == 24 ? true : false
        case 10: return hour % 12 >= 10 ? true : false
        case 56: return hour % 12 == 5 || hour % 12 == 6 ? true : false
        default: return value == hour % 12 ? true : false
        }
    }
    
    func isCorrectMinute(_ value: Int) -> Bool {
        switch value {
        case 0: return true
        case let m where minutes >= 10 && m == 10: return true
        case let m where minutes / 10 * 10 == m: return true
        case let m where minutes % 10 == m: return true
        default: return false
        }
    }
    
    func showDayOrNightEmoji() -> String {
        return hour >= 7 && hour < 19 ? "☀️" : "🌙"
    }
    
    func showCurrentSeconds() -> String {
        var result = ""
        if seconds == 0 {
            return "영초"
        }
        if seconds / 10 >= 1 {
            if seconds / 10 > 1 {
                result += units[seconds / 10]
            }
            result += "\(units[10])\n"
        }
        result += "\(units[seconds % 10])초"
        return result
    }
}
