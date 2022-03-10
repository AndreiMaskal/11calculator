//
//  ViewController.swift
//  Calculator
//
//  Created by Andrei Maskal on 10/03/2022.
//

import UIKit

class ViewController: UIViewController {
    var numberSkrini: Float = 0
    var firstNum: Float = 0
    var mustSing: Bool = false
    var operation: Int = 0
    @IBOutlet weak var result: UILabel!
    
    @IBAction func number(_ sender: UIButton) {
        
        if mustSing == true {
            result.text = String(sender.tag)
            mustSing = false
        } else {
            result.text = result.text! + String(sender.tag)
        }
        
        numberSkrini = Float(result.text!)!
    }
    
    @IBAction func buttons(_ sender: UIButton) {
        if result.text != "" && sender.tag != 16  && sender.tag != 11 {
            firstNum = Float(result.text ?? "") ?? 0
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
        }
        mustSing = true
        operation = sender.tag
    }
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Do any additional setup after loading the view.
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    



