
//  ViewController.swift
//  Calculator
//
//  Created by Andrei Maskal on 10/03/2022.

import UIKit

class ViewController: UIViewController  {
    var numberSkrini: Float = 0
    var firstNum: Float = 0
    var mustSing: Bool = true
    var operation: Int = 0
    var firstEkran = false
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
    
    override func viewDidLoad() {
        super.viewDidLoad()
        result.text = "0"
    }
    
    @IBAction func number(_ sender: UIButton) {
        if mustSing {
            result.text = String(sender.tag)
            mustSing = false
            croup = false
            firstEkran = true
        } else {
            result.text = result.text! + String(sender.tag)
            firstEkran = false
        }
        if firstEkran && sender.tag == 0 {
            firstEkran = false
            result.text = "0"
            mustSing = true
        }
        numberSkrini = currentInput
    }
    
    @IBAction func croup(_ sender: UIButton) {
        if !result.text!.contains(".") {
            result.text = result.text! + "."
            mustSing = false
        }
    }
    
    @IBAction func buttons(_ sender: UIButton) {
        if result.text != "" && sender.tag != 16  && sender.tag != 11 {
            firstNum = currentInput
            
            if sender.tag  == 12 { // plus
                result.text = "+"
            } else if  sender.tag == 13 { // minus
                result.text = "-"
            } else if  sender.tag == 14 { // multiplay
                result.text = "*"
            } else if  sender.tag == 15 { // divide
                result.text = "/"
            }
        } else if sender.tag == 16 { // sum
            if operation == 12 {
                currentInput = firstNum + numberSkrini
            } else if operation == 13 {
                currentInput = firstNum - numberSkrini
            } else if operation == 14 {
                currentInput = firstNum * numberSkrini
            } else if operation == 15 {
                currentInput = firstNum / numberSkrini
                if numberSkrini == 0 {
                    result.text = "error"
                }
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

