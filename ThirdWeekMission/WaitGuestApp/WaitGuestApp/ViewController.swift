//
//  ViewController.swift
//  WaitGuestApp
//
//  Created by Maylily on 2020/11/16.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet var progressBar: UIProgressView!
    @IBOutlet var waitButton: UIButton!
    @IBOutlet var entranceButton: UIButton!
    @IBOutlet var currentGuest: UILabel!
    
    var waitProcess = WaitProcess()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }
    
    @IBAction func clickWaitButton(_ sender: UIButton) {
        waitProcess.pushWaitButton()
        waitProcess.buttonControl()
        changeValues()
    }
    
    @IBAction func clickEntranceButton(_ sender: UIButton) {
        waitProcess.pushEntrancebutton()
        waitProcess.buttonControl()
        changeValues()
    }
    
    func changeValues() {
        waitButton.backgroundColor = waitProcess.waitButtonBackgroundColor
        waitButton.setTitleColor(waitProcess.waitButtonColor, for: .normal)
        entranceButton.backgroundColor = waitProcess.entranceButtonBackgroundColor
        entranceButton.setTitleColor(waitProcess.entranceButtonColor, for: .normal)
        currentGuest.textColor = waitProcess.currentGuestColor
        currentGuest.text = "\(String(format:"%.2d", waitProcess.currentGuestCount)) 명"
        waitButton.isEnabled = waitProcess.isEnableWaitButton
        entranceButton.isEnabled = waitProcess.isEnableEntranceButton
        progressBar.setProgress(Float(waitProcess.currentGuestCount) * (1 / 20) , animated: false)
    }
}

