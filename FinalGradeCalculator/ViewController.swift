//
//  ViewController.swift
//  FinalGradeCalculator
//
//  Created by  on 10/20/20.
//  Copyright © 2020 ZaCode. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UIPickerViewDelegate, UIPickerViewDataSource {
    
    @IBOutlet weak var currentGradeTextField: UITextField!
    @IBOutlet weak var finalExamWeightTextField: UITextField!
    @IBOutlet weak var desiredFinalGradeTextField: UITextField!
    @IBOutlet weak var resultsLabel: UILabel!

    @IBOutlet weak var desiredGradePickerView: UIPickerView!

    let letterGradeArray = ["A", "B", "C", "D"]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        resultsLabel.numberOfLines = 0
        // Do any additional setup after loading the view.
    }

    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return 1
    }
    
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        return letterGradeArray.count
    }
    
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        return letterGradeArray[row]
    }
    
    func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
         switch row {
               case 0:
                   desiredFinalGradeTextField.text = "90.0"
               case 1:
                   desiredFinalGradeTextField.text = "80.0"
               case 2:
                   desiredFinalGradeTextField.text = "70.0"
               case 3:
                   desiredFinalGradeTextField.text = "60.0"
               default:
                   print("There is an error if you see this.")
               }
    }
    
    @IBAction func calculateButton(_ sender: UIButton)
    {
        let currentGrade = Double(currentGradeTextField.text!)!
        let desiredGrade = Double(desiredFinalGradeTextField.text!)!
        let finalExamWeight = Double(finalExamWeightTextField.text!)!
        
        let result = (100 * desiredGrade - (100 - finalExamWeight) * currentGrade) / finalExamWeight
        
        print(result)
    
        if result <= 100
        {
            view.backgroundColor = UIColor.green
            resultsLabel.text = "You need to get a \(result)% on the final to get your desired grade.\n You'll be fine!"
        }
        else
        {
            view.backgroundColor = UIColor.red
            resultsLabel.text = "You need to get a \(result)% on the final to get your desired grade.\nYou should ask for extra credit from your teacher."
        }
       
    }
    
    @IBAction func letterSegmentedControl(_ sender: UISegmentedControl)
    {
        switch sender.selectedSegmentIndex {
        case 0:
            desiredFinalGradeTextField.text = "90.0"
        case 1:
            desiredFinalGradeTextField.text = "80.0"
        case 2:
            desiredFinalGradeTextField.text = "70.0"
        case 3:
            desiredFinalGradeTextField.text = "60.0"
        default:
            print("There is an error if you see this.")
        }
    }
    
    
}

