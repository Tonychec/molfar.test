//
//  ChildViewController.swift
//  molfar.test
//
//  Created by ios.nomad on 4/27/18.
//  Copyright © 2018 ios.nomad. All rights reserved.
//

import UIKit

class ChildViewController: UIViewController {

    @IBOutlet var idTextField: UITextField!
    
    var child: Child?
    
    override func viewDidLoad() {
        super.viewDidLoad()

        if let child = child {
            idTextField.text = child.id
        }
    }
    
    @IBAction func closePressed(_ sender: Any) {
        self.dismiss(animated: true, completion: nil)
    }
    
    @IBAction func savePressed(_ sender: Any) {
        if saveChild() {
            self.dismiss(animated: true, completion: nil)
        }
    }
    
    func saveChild() -> Bool {
        // Validation of required fields
        if idTextField.text!.isEmpty {
            let alert = UIAlertController(title: "Validation error", message: "Input the id of the Child!", preferredStyle: .alert)
            alert.addAction(UIAlertAction(title: "OK", style: .cancel, handler: nil))
            self.present(alert, animated: true, completion: nil)
            return false
        }
        
        // Creating object
        if child == nil {
            child = Child()
        }
        
        // Saving object
        if let child = child {
            child.id = idTextField.text
            CoreDataManager.instance.saveContext()
        }
        return true
    }
}
