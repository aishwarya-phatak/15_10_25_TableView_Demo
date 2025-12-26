//
//  EmployeeViewController.swift
//  15_10_25_TableView_Demo
//
//  Created by Vishal Jagtap on 19/12/25.
//

import UIKit

class EmployeeViewController: UIViewController {
    
    @IBOutlet weak var employeeTableView: UITableView!
    var employeeDetailsViewController : EmployeeDetailsViewController?
    let reuseIdentifierForEmployeeCell = "EmployeeTableViewCell"
    var employees = [Employee(empId: 10, empName: "Sujata", empCity: "Pune"),
                     Employee(empId: 11, empName: "Mayur", empCity: "Solapur"),
                     Employee(empId: 12, empName: "Vaishnavi", empCity: "Nashik"),
                     Employee(empId: 13, empName: "Snehal", empCity: "Mysore"),
                     Employee(empId: 14, empName: "Tejas", empCity: "Hyderabad")]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        registerCellWithTableView()
        employeeTableView.delegate = self
        employeeTableView.dataSource = self
    }
    
    func registerCellWithTableView(){
        let uiNib = UINib(nibName: "EmployeeTableViewCell", bundle: nil)
        self.employeeTableView.register(uiNib, forCellReuseIdentifier: reuseIdentifierForEmployeeCell)
    }
}

extension EmployeeViewController : UITableViewDataSource{
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return employees.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let employeeTableViewCell = self.employeeTableView.dequeueReusableCell(withIdentifier: reuseIdentifierForEmployeeCell, for: indexPath) as! EmployeeTableViewCell
        employeeTableViewCell.employeeImageView.image = UIImage(named: "test_image_2")
        employeeTableViewCell.employeeIdLabel.text = "\(employees[indexPath.row].empId)"
        employeeTableViewCell.employeeNameLabel.text = employees[indexPath.row].empName
        employeeTableViewCell.employeeCityLabel.text = employees[indexPath.row].empCity
        employeeTableViewCell.btnNext.tag = indexPath.row
        employeeTableViewCell.delegate1 = self
        return employeeTableViewCell
    }
    
    func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete{
            employeeTableView.beginUpdates()
            employeeTableView.deleteRows(at: [indexPath], with: .fade)
            employees.remove(at: indexPath.row)
            employeeTableView.endUpdates()
        }
    }
}

extension EmployeeViewController : UITableViewDelegate{
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        print("\(indexPath.section) -- \(indexPath.row)")
        
        employeeDetailsViewController = self.storyboard?.instantiateViewController(withIdentifier: "EmployeeDetailsViewController") as! EmployeeDetailsViewController
        
//        employeeDetailsViewController.empNameContainer = employees[indexPath.row].empName
//        employeeDetailsViewController.empCityContainer = employees[indexPath.row].empCity
        
        let employeeObject = Employee(empId: employees[indexPath.row].empId,
                                      empName: employees[indexPath.row].empName,
                                      empCity: employees[indexPath.row].empCity)
        
        employeeDetailsViewController!.employeeContainer = employeeObject
        
        self.navigationController?.pushViewController(employeeDetailsViewController!, animated: true)
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 121.0
    }
}

extension EmployeeViewController : EmployeeTableViewCellDelegate{
    func sendData(tagNumber: Int) {
        print(tagNumber)
    }
}
