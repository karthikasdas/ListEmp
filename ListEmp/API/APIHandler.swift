//
//  APIHandler.swift
//  ListEmp
//
//  Created by Karthika on 10/25/22.
//

import Foundation


struct NetworkError: Error {
    let msg: String
}

struct ParseError: Error {
    let msg: String
}

protocol RequestHandler {
    
    func makeRequest() -> Request
}

class Request {
    private var request: URLRequest
    
    init(urlRequest:URLRequest) {
        self.request = urlRequest
    }
    
    var urlRequest: URLRequest {
        return request
    }
}

protocol ResponseHandler {
    associatedtype ResponseDataType
    func parseResponse(data: Data) throws -> ResponseDataType
}

protocol Response: Codable {
    var employees: [Employee] { set get }
}

extension ResponseHandler {
    
    func defaultParseResponse<T: Response>(data: Data) throws -> T {
        if let response = try? JSONDecoder().decode(T.self, from: data), response.employees.count > 0 {
            return response
        } else {
            throw ParseError(msg: "Error while parsing data")
        }
    }
}

typealias APIHandler = RequestHandler & ResponseHandler
