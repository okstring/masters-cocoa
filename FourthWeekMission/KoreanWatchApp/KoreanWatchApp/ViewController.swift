//
//  ViewController.swift
//  KoreanWatchApp
//
//  Created by Maylily on 2020/11/23.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet var seconds: UILabel!
    @IBOutlet var verticalStackView: UIStackView!
    override func viewDidLoad() {
        let tictic = DispatchWorkItem {
            _ = Timer.scheduledTimer(timeInterval: 1.0, target: self, selector: #selector(self.callback), userInfo: nil, repeats: true)
        }
        
        DispatchQueue.main.async(execute: tictic)
    }
    
    var brain = WatchBrain()
    
    @objc func callback() {
        for lineStackView in verticalStackView.subviews.compactMap({ $0 as? UIStackView }){
            for label in lineStackView.subviews.compactMap({ $0 as? UILabel }) {
                label.textColor = .lightGray
                if label.text == "🌙" || label.text == "☀️" {
                    label.text = brain.showDayOrNightEmoji()
                } else if label.tag == 0 {
                    label.text = brain.showCurrentSeconds()
                } else {
                    if brain.isThisLableCurrentTime(label.tag) {
                        label.textColor = .white
                    }
                }
            }
        }
        
        UIView.transition(with: seconds, duration: 0.5, options: .transitionCrossDissolve, animations: {
            self.seconds.font = self.seconds.font.withSize(25)
        }) { isFinished in
            UIView.transition(with: self.seconds, duration: 0.5, options: .transitionCrossDissolve, animations: {
                self.seconds.font = self.seconds.font.withSize(20)
            })
        }
    }
}

