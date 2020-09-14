//
//  ViewController.swift
//  tipCalcu
//
//  Created by Natalie Meneses on 9/13/20.
//  Copyright © 2020 Codepath. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var tipLabel: UILabel!
    @IBOutlet weak var totalLabel: UILabel!
    @IBOutlet weak var billField: UITextField!
    @IBOutlet weak var tipControl: UISegmentedControl!
    @IBOutlet weak var eachPersonSlider: UISlider!
    @IBOutlet weak var eachPersonLabel: UILabel!
    @IBOutlet weak var eachPersonAmount: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }
    @IBAction func onTap(_ sender: Any) {
        view.endEditing(true)
    }
    
    
    @IBAction func calculateTip(_ sender: Any) {
        
        //Get the bill amount
        let bill = Double(billField.text!) ?? 0
        //Calculate the tip and total
        let tipPercentages = [0.15,0.18,0.2]
        
        let tip = bill * tipPercentages[tipControl.selectedSegmentIndex]
        let total = bill + tip
        //Update the tip and total labels
        tipLabel.text = String(format: "%.2f", tip)
            totalLabel.text = String(format: "$%.2f", total)
        
        let numberOfPeople = Int(eachPersonSlider.value)
        eachPersonLabel.text="Split: \(numberOfPeople)"
        let eachTotal=total/Double(numberOfPeople)
        eachPersonAmount.text = String(format: "$%.2f", eachTotal)
        
    }
    
}

