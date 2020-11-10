//
//  ViewController.swift
//  TueMission
//
//  Created by Maylily on 2020/11/10.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet var textField: UITextField!
    @IBOutlet var resultMeasurement: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }

    @IBAction func ConvertButtonTouch(_ sender: Any) {
        func unitFormatter(num: Int) -> String {
            let previousValue = Measurement(value: Double(num) , unit: UnitLength.meters)
            let convertValue = previousValue.converted(to: UnitLength.yards)
            let measureFormatter = MeasurementFormatter()
            return measureFormatter.string(from: convertValue)
        }
        
        if let unwrappingString = textField.text {
            guard let measurementValue  = Int(unwrappingString) else {
                return resultMeasurement.text = "정확한 숫자 값을 입력해주세요"
            }
            resultMeasurement.text = unitFormatter(num: measurementValue)
        }
    }
}

