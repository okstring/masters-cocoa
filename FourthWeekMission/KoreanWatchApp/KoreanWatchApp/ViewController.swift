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
    
    @objc func callback() {
        let brain = WatchBrain()
        
        for lineStackView in verticalStackView.subviews.compactMap({ $0 as? UIStackView }){
            for label in lineStackView.subviews.compactMap({ $0 as? UILabel }) {
                label.textColor = .lightGray
                if label.text == "🌙" || label.text == "☀️" || label.tag == 500 {
                    label.text = brain.showStrLabelCurrentTime(label.tag)
                } else {
                    if brain.isThisLabelCurrentTime(label.tag) {
                        label.textColor = .white
                    }
                }
            }
        }
        
        self.seconds.textColor = .white
        UIView.transition(with: seconds, duration: 0.7, options: .transitionCrossDissolve, animations: {
            self.seconds.font = self.seconds.font.withSize(25)
            
        }) { isFinished in
            UIView.transition(with: self.seconds, duration: 0.3, options: .transitionCrossDissolve, animations: {
                self.seconds.font = self.seconds.font.withSize(20)
            })
        }
        
    }
}

