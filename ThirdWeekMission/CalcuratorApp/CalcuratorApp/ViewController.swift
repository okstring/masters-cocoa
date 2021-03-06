//
//  ViewController.swift
//  CalcuratorApp
//
//  Created by Maylily on 2020/11/18.
//

import UIKit

class ViewController: UIViewController {
    @IBOutlet var firstStack: UIButton!
    @IBOutlet var secondStack: UIButton!
    @IBOutlet var thirdStack: UIButton!
    @IBOutlet var fourthStack: UIButton!
    @IBOutlet var fifStack: UIButton!
    @IBOutlet var display: UILabel!
    
    var calcurator = Calcurator()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }
    
    
    @IBAction func clickDigit(_ sender: UIButton) {
        calcurator.currentNumber += sender.currentTitle ?? ""
        display.text = calcurator.displayNumber
    }
    
    @IBAction func equal(_ sender: UIButton) {
        display.text = calcurator.interCalculation(sign: .equal)
        updateStack()
    }
    @IBAction func plus(_ sender: UIButton) {
        display.text = calcurator.interCalculation(sign: .plus)
        updateStack()
    }
    @IBAction func minus(_ sender: UIButton) {
        display.text = calcurator.interCalculation(sign: .minus)
        updateStack()
    }
    @IBAction func multiple(_ sender: UIButton) {
        display.text = calcurator.interCalculation(sign: .multiple)
        updateStack()
    }
    @IBAction func divide(_ sender: UIButton) {
        display.text = calcurator.interCalculation(sign: .divide)
        updateStack()
    }
    
    override func motionEnded(_ motion: UIEvent.EventSubtype, with event: UIEvent?) {
        if motion == .motionShake {
            calcurator.stack.reset()
            resetStack()
            display.text = ""
        }
    }
    
    func updateStack() {
        if let count = calcurator.stack.size() {
            if count >= 5 {
                fifStack.setTitle(String(calcurator.stack.items[4]), for: .normal)
            }
            if count >= 4 {
                fourthStack.setTitle(String(calcurator.stack.items[3]), for: .normal)
            }
            if count >= 3 {
                thirdStack.setTitle(String(calcurator.stack.items[2]), for: .normal)
            }
            if count >= 2 {
                secondStack.setTitle(String(calcurator.stack.items[1]), for: .normal)
            }
            if count >= 1 {
                firstStack.setTitle(String(calcurator.stack.items[0]), for: .normal)
            }
        }
    }
    
    func resetStack() {
        firstStack.setTitle("Stack1", for: .normal)
        secondStack.setTitle("Stack2", for: .normal)
        thirdStack.setTitle("Stack3", for: .normal)
        fourthStack.setTitle("Stack4", for: .normal)
        fifStack.setTitle("Stack5", for: .normal)
    }
}

