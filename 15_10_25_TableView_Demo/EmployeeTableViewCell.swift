//
//  EmployeeTableViewCell.swift
//  15_10_25_TableView_Demo
//
//  Created by Vishal Jagtap on 19/12/25.
//

import UIKit

protocol EmployeeTableViewCellDelegate : AnyObject{
    func sendData(tagNumber : Int)
}

class EmployeeTableViewCell: UITableViewCell {
    
    @IBOutlet weak var employeeImageView: UIImageView!
    @IBOutlet weak var employeeIdLabel: UILabel!
    @IBOutlet weak var employeeNameLabel: UILabel!
    @IBOutlet weak var employeeCityLabel: UILabel!
    
    var delegate1 : EmployeeTableViewCellDelegate?
    
    @IBOutlet weak var btnNext: UIButton!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        print("awake from Nib called")
        
        employeeIdLabel.layer.cornerRadius = 2.0
        employeeIdLabel.layer.borderColor = CGColor(red: 100.0,
                                                    green: 0.0,
                                                    blue: 100.0,
                                                    alpha: 1.0)
        employeeIdLabel.layer.borderWidth = 2.0
        
        employeeIdLabel.backgroundColor = .white
        
        employeeCityLabel.layer.cornerRadius = 2.0
        employeeCityLabel.layer.borderColor = CGColor(red: 100.0,
                                                    green: 0.0,
                                                    blue: 100.0,
                                                    alpha: 0.4)
        employeeCityLabel.layer.borderWidth = 2.0
        
        employeeCityLabel.backgroundColor = .white
        
        employeeNameLabel.layer.cornerRadius = 2.0
        employeeNameLabel.layer.borderColor = CGColor(red: 100.0,
                                                    green: 0.0,
                                                    blue: 100.0,
                                                    alpha: 0.4)
        employeeNameLabel.layer.borderWidth = 2.0
        employeeNameLabel.backgroundColor = .white
    }
    

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
        print(selected)
        if selected == false{
            backgroundColor = .orange
        } else {
            backgroundColor = .magenta
        }
    }
    
    @IBAction func btnNextClicked(_ sender: UIButton) {
        delegate1?.sendData(tagNumber: sender.tag)
    }
}
