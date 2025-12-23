//
//  EmployeeDetailsViewController.swift
//  15_10_25_TableView_Demo
//
//  Created by Vishal Jagtap on 23/12/25.
//

import UIKit

class EmployeeDetailsViewController: UIViewController {

    @IBOutlet weak var empNameLabel: UILabel!
    @IBOutlet weak var empCityLabel: UILabel!
    
//    var empNameContainer : String?
//    var empCityContainer : String?
    
    var employeeContainer : Employee?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        extractAndBindEmployeeData()
    }
    
    func extractAndBindEmployeeData(){
        empNameLabel.text = employeeContainer?.empName
        empCityLabel.text = employeeContainer?.empCity
    }
}
