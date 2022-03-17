//
//  ViewController.swift
//  Calculator
//
//  Created by Andrei Maskal on 10/03/2022.
//

import UIKit

class ViewController: UIViewController  {
    var numberSkrini: Float = 0
    var firstNum: Float = 0
    var mustSing: Bool = false
    var operation: Int = 0
    var croup = false
    var currentInput: Float {
        get {
            return Float(result.text ?? "") ?? 0
        }
        set {
            let value = "\(newValue)"
            let valueArray = value.components(separatedBy:".")
            if valueArray[1] == "0" {
                result.text = "\(valueArray[0])"
            } else {
                result.text = "\(newValue)"
            }
        mustSing = false
        }
    }
    @IBOutlet weak var result: UILabel!
    
    @IBAction func number(_ sender: UIButton) {
        if mustSing  {
            result.text = String(sender.tag)
            mustSing = false
            croup = false
        } else {
            result.text = result.text! + String(sender.tag)
        }
        numberSkrini = currentInput
    }
    @IBAction func croup(_ sender: UIButton) {
        if !mustSing && !croup {
            result.text = result.text! + "."
            croup = true
        }
    }
    @IBAction func buttons(_ sender: UIButton) {
        if result.text != "" && sender.tag != 16  && sender.tag != 11 {
            firstNum = currentInput
            if sender.tag  == 12 { // plus
                result.text = "+"
            } else if  sender.tag == 13 { // minus
                result.text = "-"
            } else if  sender.tag == 14 { // divide
                result.text = "/"
            } else if  sender.tag == 15 { // multiplay
                result.text = "*"
            }
        } else if sender.tag == 16 { // sum
            if operation == 12 {
                result.text = String(firstNum + numberSkrini)
            } else if operation == 13 {
                result.text = String(firstNum - numberSkrini)
            } else if operation == 14 {
                result.text = String(firstNum / numberSkrini)
            } else if operation == 15 {
                result.text = String(firstNum * numberSkrini)
            }
        } else if sender.tag == 11 {
            result.text = " "
            firstNum = 0
            numberSkrini = 0
            operation = 0
            result.text = (result.text ?? "") + "0"
        }
        
        mustSing = true
        croup = true
        operation = sender.tag
    }
}
