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
        var actionView = ActionView()
        let levelValue = checkPassword.examinePassword(password: passwordInput.text ?? "")
        actionView.changeValue(levelValue)
        
        descriptionLabel.text = actionView.descriptionLabelText
        levelView.backgroundColor = actionView.backgroundColor
    }
}

