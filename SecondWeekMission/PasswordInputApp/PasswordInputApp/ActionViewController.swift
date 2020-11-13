import Foundation
import UIKit

struct ActionView {
    var backgroundColor: UIColor
    var descriptionLabelText: String
    
    init() {
        backgroundColor = .gray
        descriptionLabelText = "암호를 입력해주세요"
    }
    
    mutating func changeValue(_ level: Int) {
        switch level {
        case 1:
            backgroundColor = UIColor.red
            descriptionLabelText = "아주 약한 암호"
        case 2:
            backgroundColor = UIColor.orange
            descriptionLabelText = "약한 암호"
        case 3:
            backgroundColor = UIColor.yellow
            descriptionLabelText = "보통 암호"
        case 4:
            backgroundColor = UIColor.blue
            descriptionLabelText = "강한 암호"
        case 5:
            backgroundColor = UIColor.green
            descriptionLabelText = "아주 강한 암호"
        default:
            backgroundColor = UIColor.gray
            descriptionLabelText = "암호를 입력해주세요"
        }
    }
}
