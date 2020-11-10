//
//  ViewController.swift
//  HelloCafe
//
//  Created by Maylily on 2020/11/10.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet var menuImageView: UIImageView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }

    @IBAction func menuButtonTouched(_ sender: Any) {
        menuImageView.image = UIImage(named: "cafe-latte.jpg")
    }
    
}

