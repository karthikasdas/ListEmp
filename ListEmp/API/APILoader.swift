//
//  APILoader.swift
//  ListEmp
//
//  Created by Karthika on 10/25/22.
//

import Foundation

class APILoader<T: APIHandler> {
    
    let apiRequest: T
    let urlSession: URLSession
    let reachability: Reachability
    
    init(apiRequest: T, urlSession: URLSession = .shared, reachability: Reachability = Reachability()!) {
        self.apiRequest = apiRequest
        self.urlSession = urlSession
        self.reachability = reachability
    }
    
    func loadApiRequest(completionHandler: @escaping (T.ResponseDataType?, Error?) -> ()) {
        if reachability.connection == .none {
            return completionHandler(nil, NetworkError(msg: "No Internet Connection"))
        }
        let urlRequest = apiRequest.makeRequest().urlRequest
        urlSession.dataTask(with: urlRequest) { data, response, error in
            guard let data = data else { return completionHandler(nil, error)
            }
                do {
                    let parsedResponse = try self.apiRequest.parseResponse(data: data)
                    return completionHandler(parsedResponse,nil)
                } catch {
                    return completionHandler(nil, error)
                }
        }.resume()
    }
}
