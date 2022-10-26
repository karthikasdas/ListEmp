//
//  EmployeeServices.swift
//  ListEmp
//
//  Created by Karthika on 10/25/22.
//

import Foundation
import UIKit

class EmployeeServices {
    
    func getEmployeeDetails(completion: @escaping (Employees?, Error?) -> ()) {
        let api = EmployeeAPI()
        let loader = APILoader(apiRequest: api)
        loader.loadApiRequest() { (result, error) in
            completion(result, error)
        }
    }
}
