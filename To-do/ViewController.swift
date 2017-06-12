//
//  ViewController.swift
//  To-do
//
//  Created by Ameya Vichare on 05/06/17.
//  Copyright © 2017 vit. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UITableViewDelegate,UITableViewDataSource {

    @IBOutlet weak var textFieldInput: UITextField!
    
    @IBOutlet weak var listTable: UITableView!
    
    @IBOutlet weak var addButton: UIBarButtonItem!
    
    var listArray = [String]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        listTable.backgroundColor = UIColor.clear
        listTable.separatorStyle = .none
        
        if let list = UserDefaults.standard.array(forKey: "list") as? [String] {
            
            listArray = list
        }
        else {
            
            print("no list")
        }

    }

    @IBAction func doneButton(_ sender: Any) {
        
        if textFieldInput.text?.isEmpty == false {
            
            listArray.insert(textFieldInput.text!, at: 0)
            
            textFieldInput.text = ""
            
            listTable.reloadData()
            
            textFieldInput.resignFirstResponder()
        }
        
        
    }

    func numberOfSections(in tableView: UITableView) -> Int {
        
        return 1
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        return listArray.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = listTable.dequeueReusableCell(withIdentifier: "listCell", for: indexPath) as! listTableViewCell
        cell.checkLabel.text = listArray[indexPath.row]
        cell.backgroundColor = UIColor.clear
        cell.selectionStyle = .none
        
        cell.backView.layer.cornerRadius = 5
        cell.backView.clipsToBounds = true
        
        return cell
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        
        UserDefaults.standard.set(listArray, forKey: "list")
        
    }
}

