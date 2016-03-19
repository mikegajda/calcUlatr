//
//  ViewController.swift
//  calcUlatr
//
//  Created by Mike Gajda on 3/19/16.
//  Copyright © 2016 Preference Digital. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UITextFieldDelegate {
    
    // MARK: Properties
    
    
    //@IBOutlet weak var courseName: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // HAndle the text field's user input
        //courseName.delegate = self
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    // MARK: UITextFieldDelegate
    
    func textFieldShouldReturn(textField: UITextField) -> Bool {
        // Hide the keyboard.
        textField.resignFirstResponder()
        return true
    }
    
    func textFieldDidEndEditing(textField: UITextField) {
//        mycategoryNameLabel.text = textField.text
    }

    
    // MARK: Actions
    
    


}

