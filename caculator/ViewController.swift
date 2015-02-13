//
//  ViewController.swift
//  caculator
//
//  Created by Guanxiong Ding on 2/8/15.
//  Copyright (c) 2015 Guanxiong Ding. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet weak var display: UILabel!
    
    var isTypingDigit = false
    
    var opStack = [Double]()
    
    @IBAction func digitButton(sender: UIButton) {
        
        let digit = sender.currentTitle!
        
        if (isTypingDigit) {
            display.text = display.text! + digit
        } else {
            isTypingDigit = true
            display.text = digit;
        }
    }
    @IBAction func enter() {
        isTypingDigit = false
        opStack.append((display.text! as NSString).doubleValue)
        println(opStack)
    }
    
    @IBAction func operation(sender: UIButton) {
        let operation = sender.currentTitle!
        let op1 = opStack.removeLast()
        let op2 = opStack.removeLast()
        switch operation {
        case "×":
            displayValue = op1 * op2
        case "÷":
            displayValue = op2 / op1
        case "+":
            displayValue = op1 + op2
        case "−":
            displayValue = op2 * op1
        default:
            displayValue = 0
        }
    }
    
    var displayValue: Double {
        get {
            return (display.text! as NSString).doubleValue
        }
        set {
            display.text = "\(newValue)"
            isTypingDigit = false
        }
    }
}