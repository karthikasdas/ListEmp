//
//  EmployeeBusiness.swift
//  ListEmp
//
//  Created by Karthika on 10/25/22.
//

import Foundation

class EmployeeBusiness {
    
    private lazy var employeeService = EmployeeServices()
    
    func getEmployeeDetails(completion: @escaping ((_ employee: Employees?, _ error: Error?) -> ()) ) {
        employeeService.getEmployeeDetails(){ (result, error) in
        completion(result,error)
        }
    }
                                           
}
