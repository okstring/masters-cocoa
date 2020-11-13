//
//  ViewController.swift
//  PasswordInputApp
//
//  Created by Maylily on 2020/11/11.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet var passwordInput: UITextField!
    @IBOutlet var levelView: UIView!
    @IBOutlet var descriptionLabel: UILabel!
    @IBOutlet var recommendPasswordLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        let makePassword = CheckPassword()
        recommendPasswordLabel.text = "추천 암호: \(makePassword.makeStrongPassword())"
    }
    
    @IBAction func clickButton(_ sender: UIButton) {
        var checkPassword = CheckPassword()
        switch checkPassword.examinePassword(password: passwordInput.text ?? "") {
        case 1:
            levelView.backgroundColor = UIColor.red
            descriptionLabel.text = "아주 약한 암호"
        case 2:
            levelView.backgroundColor = UIColor.orange
            descriptionLabel.text = "약한 암호"
        case 3:
            levelView.backgroundColor = UIColor.yellow
            descriptionLabel.text = "보통 암호"
        case 4:
            levelView.backgroundColor = UIColor.blue
            descriptionLabel.text = "강한 암호"
        case 5:
            levelView.backgroundColor = UIColor.green
            descriptionLabel.text = "아주 강한 암호"
        default:
            levelView.backgroundColor = UIColor.gray
            descriptionLabel.text = "암호를 입력해주세요"
        }
    }
}

