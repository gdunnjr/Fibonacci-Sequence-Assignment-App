//
//  ViewController.swift
//  FibonacciApp
//
//  Created by Gerald Dunn on 2/6/15.
//  Copyright (c) 2015 Gerald Dunn. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet weak var textView: UITextView!
    
    @IBOutlet weak var includesZeroSwitch: UISwitch!
    
    @IBOutlet weak var includesZeroLabel: UILabel!
    
    
    @IBOutlet weak var numberOfItemsLabel: UILabel!

    @IBOutlet weak var numberOfItemsSlider: UISlider!
    
    
    var fibonacciSequence = FibonacciSequence(maxNumber: 2, includesZero: true)
    
    override func viewDidLoad() {
        super.viewDidLoad()
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        self.updateFibonacciSequence()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    @IBAction func updateFibonacciSequence() {
        println(numberOfItemsSlider.value)
        
        if includesZeroSwitch.on {
            includesZeroLabel.text = "Yes"
        } else {
            includesZeroLabel.text = "No"
        }
        
        numberOfItemsLabel.text = String(UInt(numberOfItemsSlider.value))
        
        if includesZeroSwitch.on {
            numberOfItemsSlider.maximumValue = 94
        } else {
            numberOfItemsSlider.maximumValue = 93
        }
        
        fibonacciSequence = FibonacciSequence(numberOfItemsInSequence: UInt64(numberOfItemsSlider.value), includesZero: includesZeroSwitch.on)
        
        textView.text = fibonacciSequence.values.description
    }

}

