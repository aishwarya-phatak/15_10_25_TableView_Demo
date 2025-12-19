//
//  ViewController.swift
//  15_10_25_TableView_Demo
//
//  Created by Vishal Jagtap on 17/12/25.
//

import UIKit

class ViewController: UIViewController{

    @IBOutlet weak var menuItemsTableView: UITableView!
    
    var vegMenuItems = ["Dosa", "Idli","Pulav","Samosa Chaat","Uttappa"]
    var nonvegMenuItems = ["Chicken Biryani", "Abc","Abc","Abc","Abc"]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        menuItemsTableView.delegate = self
        menuItemsTableView.dataSource = self
    }
}

//MARK : Menu Table View conforms to UITableViewDataSource
extension ViewController : UITableViewDataSource{

    func numberOfSections(in tableView: UITableView) -> Int {
        return 2
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        if section == 0 {
            vegMenuItems.count
        }else{
            nonvegMenuItems.count
        }
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        if indexPath.section == 0{
            
            let basicCell = self.menuItemsTableView.dequeueReusableCell(withIdentifier: "BasicCell", for: indexPath)
            
            basicCell.textLabel?.text = "Bitcode \(indexPath.section) -- \(indexPath.row)"
            basicCell.backgroundColor = .orange
            
            return basicCell
        }else{
            let basicCell = self.menuItemsTableView.dequeueReusableCell(withIdentifier: "BasicCell", for: indexPath)
            
            basicCell.textLabel?.text = "Bitcode \(indexPath.section) -- \(indexPath.row)"
            basicCell.backgroundColor = .cyan
            return basicCell
        }
    }
    
    func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        if section == 0{
            return "Veg Menu Items"
        }else{
            return "Non Veg Menu Items"
        }
    }
}


//MARK : Menu Table View conforms to UITableViewDelegate
extension ViewController : UITableViewDelegate{
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 50.0
    }
}
