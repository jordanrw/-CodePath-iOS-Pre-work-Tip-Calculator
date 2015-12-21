//
//  ViewController.swift
//  tips
//
//  Created by Jordan White on 12/20/15.
//  Copyright © 2015 Two Beards and Fro. All rights reserved.
//

import UIKit




class ViewController: UIViewController {

    
    @IBOutlet weak var billField: TSCurrencyTextField!
    @IBOutlet weak var tipLabel: UILabel!
    @IBOutlet weak var totalLabel: UILabel!
    @IBOutlet weak var tipControl: UISegmentedControl!
    
    @IBOutlet weak var padding: UIView!
    @IBOutlet weak var plus: UILabel!
    @IBOutlet weak var equal: UILabel!
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        //UI set up
        UIApplication.sharedApplication().statusBarStyle = .LightContent
        billField.becomeFirstResponder();
        
        
        //set up the labels
        tipLabel.text = "$0.00";
        totalLabel.text = "$0.00";
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    @IBAction func editingChanged(sender: AnyObject) {
        
        var tipPercentages = [0.15, 0.18, 0.2, 0.22];
        let tipPercentage = tipPercentages[tipControl.selectedSegmentIndex]
        
//        let string = NSString(string: billField.text!)
//        let billAmount = string.doubleValue;
        
        let billAmount = billField.amount.doubleValue
        
        let tip = billAmount * tipPercentage
        let total = billAmount + tip
        
        tipLabel.text = "$\(tip)"
        totalLabel.text = "$\(total)"
        
        tipLabel.text = String(format: "$%.2f", tip)
        totalLabel.text = String(format: "$%.2f", total)
    }
    
    @IBAction func onTap(sender: AnyObject) {
        billField.resignFirstResponder()
    }
    
    
    @IBAction func switchToLight(sender: UISwitch) {
        
    //LIGHT
        if (sender.on == true) {
            
            billField.textColor = UIColor(red:0.15, green:0.15, blue:0.15, alpha:1)
            tipLabel.textColor = UIColor(red:0.15, green:0.15, blue:0.15, alpha:1)
            
            totalLabel.textColor = UIColor(red:0.15, green:0.15, blue:0.15, alpha:1)
            totalLabel.backgroundColor = UIColor(red:0.97, green:0.97, blue:0.97, alpha:1)
            padding.backgroundColor = UIColor(red:0.97, green:0.97, blue:0.97, alpha:1)
            
            plus.textColor = UIColor(red:0.13, green:0.13, blue:0.13, alpha:1)
            equal.textColor = UIColor(red:0.13, green:0.13, blue:0.13, alpha:1)
            
            tipControl.tintColor = UIColor(red:0.15, green:0.15, blue:0.15, alpha:1)
            self.view.backgroundColor = UIColor.whiteColor()
            UIApplication.sharedApplication().statusBarStyle = .Default
            
            billField.keyboardAppearance = UIKeyboardAppearance.Light;
            billField.resignFirstResponder()
            billField.becomeFirstResponder()
        
         
     //DARK
        } else {
            billField.textColor = UIColor.whiteColor()
            tipLabel.textColor = UIColor.whiteColor()
            
            totalLabel.textColor = UIColor.whiteColor()
            totalLabel.backgroundColor = UIColor(red:0.13, green:0.13, blue:0.13, alpha:1)
            padding.backgroundColor = UIColor(red:0.13, green:0.13, blue:0.13, alpha:1)
            
            plus.textColor = UIColor.whiteColor()
            equal.textColor = UIColor.whiteColor()
            
            tipControl.tintColor = UIColor.whiteColor()
            self.view.backgroundColor = UIColor(red:0.15, green:0.15, blue:0.15, alpha:1)
            UIApplication.sharedApplication().statusBarStyle = .LightContent
            
            billField.keyboardAppearance = UIKeyboardAppearance.Dark;
            billField.resignFirstResponder()
            billField.becomeFirstResponder()
        }
        
    }


    
    

}

