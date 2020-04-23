//
//  FirstViewController.swift
//  TodoListApp
//
//  Created by Pranathi Pulimamidy on 4/14/20.
//  Copyright © 2020 Pranathi Pulimamidy. All rights reserved.
//

import UIKit

class FirstViewController: UIViewController, UITableViewDataSource, UITableViewDelegate {
    
    @IBOutlet var tableview: UITableView!
    var items:[String] = []
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return items.count
    }
    
    func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == UITableViewCell.EditingStyle.delete{
            items.remove(at: indexPath.row)
            tableView.reloadData()
            UserDefaults.standard.set(items, forKey: "items")
        }
    }
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = UITableViewCell(style: UITableViewCell.CellStyle.default, reuseIdentifier: "Cell")
        cell.textLabel?.text = items[indexPath.row] as! String
        return cell
    }
    

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        let existingItemsList = UserDefaults.standard.object(forKey: "items")
                   if let itemsList = existingItemsList as? [String]{
                       items = itemsList
                   }
                   tableview.reloadData()
    }
    
    override func viewDidAppear(_ animated: Bool) {
        let existingItemsList = UserDefaults.standard.object(forKey: "items")
        if let itemsList = existingItemsList as? [String]{
            items = itemsList
        }
        tableview.reloadData()
    }


}

