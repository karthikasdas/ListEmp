//
//  EmployeeAPI.swift
//  ListEmp
//
//  Created by Karthika on 10/25/22.
//

import Foundation

struct EmployeeAPI: APIHandler {
    
    func makeRequest() -> Request {
        let url = URL(string: URLPath().employeeData) 
        let urlReq = URLRequest(url: url!)
            let request = Request(urlRequest: urlReq)
            return request
    }
    
    func parseResponse(data: Data) throws -> Employees {
        return try defaultParseResponse(data: data)
    }
    
}
