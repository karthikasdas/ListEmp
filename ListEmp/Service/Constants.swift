//
//  Constants.swift
//  ListEmp
//
//  Created by Karthika on 10/25/22.
//

import Foundation

enum Enviornment {
    
    case Production
    
    func baseURL() -> String {
        return "https://s3.amazonaws.com/sq-mobile-interview"
    }
}

let baseUrl = Enviornment.Production.baseURL()
struct URLPath {
    
    var employeeData: String {
        return "\(baseUrl)/employees.json"
    }
}

