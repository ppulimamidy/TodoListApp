//
//  SecondViewController.swift
//  TodoListApp
//
//  Created by Pranathi Pulimamidy on 4/14/20.
//  Copyright © 2020 Pranathi Pulimamidy. All rights reserved.
//

import UIKit

class SecondViewController: UIViewController, UITextFieldDelegate{
    
   
    @IBOutlet var taskItem: UITextField!
    
    @IBAction func addTaskClicked(_ sender: UIButton) {
        var items:[String]
        let existingItemsList = UserDefaults.standard.object(forKey: "items")
        if let itemsList = existingItemsList as? [String] {
            items = itemsList
            items.append(taskItem.text!)
        }
        else{
             items = [taskItem.text!]
        }
        UserDefaults.standard.set(items, forKey: "items")
        taskItem.text = ""
    }
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any aditional setup after loading the view.
    }

    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        textField.resignFirstResponder()
        return true
    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        self.view.endEditing(true)
    }
}

