//
//  EmployeeTableViewCell.swift
//  ListEmp
//
//  Created by Karthika on 10/22/22.
//

import UIKit

/*MODEL*/
struct Employees: Response {
    var employees: [Employee]
}
struct Employee: Codable {
    
    var name: String?
    var pic: String?
    var team: String?
    var phone: String?
    var email: String?
    
    enum CodingKeys: String, CodingKey {
        case name = "full_name"
        case phone = "phone_number"
        case email = "email_address"
        case pic = "photo_url_small"
        case team
    }
    
}

final class EmployeeTableViewCell: UITableViewCell {
    
    @IBOutlet weak var employeeName: UILabel!
    @IBOutlet weak var employeePic: UIImageView!
    @IBOutlet weak var employeeTeam: UILabel!
    @IBOutlet weak var employeePhone: UILabel!
    @IBOutlet weak var employeeEmail: UILabel!

    override func prepareForReuse() {
        super.prepareForReuse()
        self.employeePic.image = UIImage(named: "Placeholder")
    }
    
    func populateDetails(employee: Employee) {
        self.employeeName.text = employee.name
        self.employeeTeam.text = employee.team
        self.employeeEmail.text = employee.email
        self.employeePhone.text = employee.phone
        if let pic = employee.pic {
            self.employeePic.loadImageUsingCache(withUrl: pic)
        }
    }
    
}
