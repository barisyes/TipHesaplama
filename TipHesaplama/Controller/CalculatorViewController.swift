//
//  ViewController.swift
//  TipHesaplama
//
//  Created by Barış Yeşilkaya on 25.07.2022.
//

import UIKit

class CalculatorViewController: UIViewController {
    
    @IBOutlet weak var billTextField: UITextField!
    @IBOutlet weak var zeroPctButton: UIButton!
    @IBOutlet weak var tenPctButton: UIButton!
    @IBOutlet weak var twentyPctButton: UIButton!
    @IBOutlet weak var splitNumberLabel: UILabel!
    
    var calculatorBrain = CalculateBrain()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }
    
    @IBAction func tipChanged(_ sender: UIButton) {
        zeroPctButton.isSelected = false
        tenPctButton.isSelected = false
        twentyPctButton.isSelected = false
        sender.isSelected = true
        
        billTextField.endEditing(true)
        
        let buttonTitle = sender.currentTitle!
        let buttonNumber = String(buttonTitle.dropFirst())
        let buttonDouble = Double(buttonNumber)!
        let tip = buttonDouble / 100
        calculatorBrain.calculateTip(tip: tip)
        
    }
    
    
    @IBAction func stepperValueChanged(_ sender: UIStepper) {
        splitNumberLabel.text = String(Int(sender.value))
    }
    
    
    @IBAction func calculatePressed(_ sender: UIButton) {
        let bill = Double(billTextField.text!)!
        let numberOfPeople = Int(splitNumberLabel.text!)!
        
        calculatorBrain.calculateResult(bill: bill, split: numberOfPeople)
        
        performSegue(withIdentifier: "goToResult", sender: self)
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "goToResult"{
            let destinationVC = segue.destination as! ResultViewController
            
            destinationVC.result = calculatorBrain.result  //result
            destinationVC.tip = calculatorBrain.tip        //Int(tip*100)
            destinationVC.split = calculatorBrain.numberOfPeople   //numberOfPeople
        }
    }
    
}


