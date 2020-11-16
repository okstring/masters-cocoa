import UIKit

struct WaitProcess {
    var waitButtonBackgroundColor: UIColor = .systemBlue
    var waitButtonColor: UIColor = .white
    var entranceButtonBackgroundColor: UIColor = .lightGray
    var entranceButtonColor: UIColor = .systemBlue
    var currentGuestColor: UIColor = .black
    var isEnableEntranceButton: Bool = true
    var isEnableWaitButton: Bool = true
    var currentGuestCount: Int = 0
    
    mutating func pushWaitButton() {
        currentGuestCount += 1
        if currentGuestCount >= 20 {
            currentGuestCount = 20
            currentGuestColor = .red
        }
    }
    
    mutating func pushEntrancebutton() {
        currentGuestCount -= 1
        if currentGuestCount < 0 { currentGuestCount = 0 }
        if currentGuestCount != 20 { currentGuestColor = .black }
    }
    
    mutating func buttonControl() {
        switch currentGuestCount {
        case 0:
            isEnableEntranceButton = false
            entranceButtonBackgroundColor = .lightGray
            entranceButtonColor = .systemBlue
        case 20:
            isEnableWaitButton = false
            waitButtonBackgroundColor = .lightGray
            waitButtonColor = .systemBlue
        default:
            isEnableEntranceButton = true
            isEnableWaitButton = true
            waitButtonBackgroundColor = .systemBlue
            waitButtonColor = .white
            entranceButtonBackgroundColor = .systemBlue
            entranceButtonColor = .white
        }
    }
}
