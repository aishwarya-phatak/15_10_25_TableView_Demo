//
//  ViewController.swift
//  15_10_25_TableView_Demo
//
//  Created by Vishal Jagtap on 17/12/25.
//

import UIKit

class ViewController: UIViewController,UITableViewDataSource,UITableViewDelegate{

    @IBOutlet weak var menuItemsTableView: UITableView!

    override func viewDidLoad() {
        super.viewDidLoad()
        menuItemsTableView.delegate = self
        menuItemsTableView.dataSource = self
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 10
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let basicCell = self.menuItemsTableView.dequeueReusableCell(withIdentifier: "BasicCell", for: indexPath)
        
        basicCell.textLabel?.text = "Bitcode \(indexPath.section) -- \(indexPath.row)"
        basicCell.backgroundColor = .orange
        
        return basicCell
    }
}
