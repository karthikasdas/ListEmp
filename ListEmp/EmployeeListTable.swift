//
//  EmployeeListTable.swift
//  ListEmp
//
//  Created by Karthika on 10/22/22.
//

import Foundation
import UIKit

class EmployeeListTable: UITableViewController {
    
    private var employee: Employees?
    private var employeeBusiness = EmployeeBusiness()
    private let refreshCtl = UIRefreshControl()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.refreshControl = refreshCtl
        refreshCtl.addTarget(self, action: #selector(self.refreshView), for: .valueChanged)
        getEmployeeDetails({})
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "employeeCell", for: indexPath) as? EmployeeTableViewCell
        if let employee = self.employee?.employees[safe: indexPath.row] {
            cell?.populateDetails(employee: employee)
        }
        return cell ?? UITableViewCell()
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.employee?.employees.count ?? 0
    }
    
    private func getEmployeeDetails(_ completion: @escaping () -> ()) {
        employeeBusiness.getEmployeeDetails { employee, error in
            if let employee = employee {
                self.employee = employee
                DispatchQueue.main.async {
                    self.tableView.reloadData()
                    return completion()
                }
            } else {
                var errorMsg = ""
                if let error = error as? NetworkError {
                    errorMsg = error.msg
                } else if let error = error as? ParseError {
                    errorMsg = error.msg
                } else {
                    errorMsg = "Some error has occured while getting the data"
                }
                DispatchQueue.main.async {
                    self.showAlert(msg: errorMsg)
                    self.tableView.setEmptyMessage("Seems like there is no data to show")
                    return completion()
                }
            }
        }
    }
    
    @objc func refreshView() {
        self.refreshCtl.beginRefreshing()
        getEmployeeDetails({
            self.refreshCtl.endRefreshing()
        })
    }
    
    private func showAlert(msg: String) {
        let alert = UIAlertController(title: "Alert", message: msg, preferredStyle: .alert)
        alert.addAction(UIAlertAction(title: "Ok", style: .default))
        self.present(alert, animated: true, completion: nil)
    }
}


extension Collection {
    subscript (safe index: Index) -> Element? {
        return indices.contains(index) ? self[index] : nil
    }
}
