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
    @IBOutlet weak var tipSlider: UISlider!
    @IBOutlet weak var eachPersonAmount: UILabel!
    @IBOutlet weak var tipAmountLabel: UILabel!
    
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
        let tipPercent = tipSlider.value
        let tipAmount = bill * Double(tipPercent) / 100
        tipLabel.text = String(format: "$%.1f", tipPercent)
        tipAmountLabel.text =  String(format: "$%.2f", tipAmount)

        //Update the tip and total labels
        let total = bill + tipAmount
        let finTotal = round(total*100)/100
        totalLabel.text=String(format: "$%.2f", finTotal)

        //Get the slider and total amount for each person
        let numberOfPeople = Int(eachPersonSlider.value)
        eachPersonLabel.text="Split: \(numberOfPeople)"
        let eachTotal=total/Double(numberOfPeople)
        eachPersonAmount.text = String(format: "$%.2f", eachTotal)

        
    }

    
    
}

