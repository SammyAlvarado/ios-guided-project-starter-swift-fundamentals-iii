//
//  ViewController.swift
//  TurkeyCalculator
//
//  Created by Paul Solt on 6/3/19.
//  Copyright © 2019 Lambda, Inc. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    // Outlets
    
    @IBOutlet var turkeyWeightTextField: UITextField!
    @IBOutlet var cookTimeTextField: UITextField!
    @IBOutlet var metricButton: UIButton!
    
    // Actions
    
    @IBAction func calculateButtonPressed(_ sender: Any) {
        
        // get the input from the user in turkeyweighTextField
        guard let turkeyWeightString = turkeyWeightTextField.text else {return}
        
        guard let turkeyWeight = Double(turkeyWeightString) else {
            print("Invalid Number")
            return
        }
        
        // Calculate cook time based on turkey weigh and metric system used
        var durationInMinutes: Double
        
        if metricButton.isSelected {
            durationInMinutes = cookTimeInKilograms(turkeyWeight)
        } else {
            durationInMinutes = cookTimeInPounds(turkeyWeight)
        }
        
        // Present the cook time to the user in the cooktimeTextField
        let durationInHours = durationInMinutes / 60
          cookTimeTextField.text = "\(durationInHours) minutes"
//        cookTimeTextField.text = "\(durationInMinutes) minutes"
    }
    
    @IBAction func metricButtonPressed(_ sender: Any) {
        
        // Conditional Downcast
        
        guard let button = sender as? UIButton else {
            return
        }
        button.isSelected.toggle()
        
    }
    
    // Helper functions
    
    func cookTimeInPounds(_ weight: Double) -> Double {
        let durationInMinutes = weight * 15.0
        return durationInMinutes
    }
    func cookTimeInKilograms(_ weight: Double) -> Double {
        var durationINMinutes: Double
        
        if weight >= 4 {
            durationINMinutes = 20 * weight + 90
        } else {
            durationINMinutes = 20 * weight + 70
        }
        
        return durationINMinutes
    }
    
}
