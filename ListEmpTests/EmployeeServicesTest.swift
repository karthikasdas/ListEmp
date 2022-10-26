//
//  EmployeeServicesTest.swift
//  ListEmpTests
//
//  Created by Karthika on 10/26/22.
//

import XCTest
@testable import ListEmp

class EmployeeServicesTest: XCTestCase {

    let request = EmployeeAPI()
    
    override func setUpWithError() throws {
        // Put setup code here. This method is called before the invocation of each test method in the class.
    }

    override func tearDownWithError() throws {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
    }
    
    func testSuccessResponse() {
        let sampleResponse =
        """
        {
            "employees" : [
                {
              "uuid" : "0d8fcc12-4d0c-425c-8355-390b312b909c",

              "full_name" : "Justine Mason",
              "phone_number" : "5553280123",
              "email_address" : "jmason.demo@squareup.com",
              "biography" : "Engineer on the Point of Sale team.",

              "photo_url_small" : "https://s3.amazonaws.com/sq-mobile-interview/photos/16c00560-6dd3-4af4-97a6-d4754e7f2394/small.jpg",
              "photo_url_large" : "https://s3.amazonaws.com/sq-mobile-interview/photos/16c00560-6dd3-4af4-97a6-d4754e7f2394/large.jpg",

              "team" : "Point of Sale",
              "employee_type" : "FULL_TIME"
            }]
        }
        """
        let jsonData = sampleResponse.data(using: .utf8)!
        
        do {
            let _ = try request.parseResponse(data: jsonData)
            XCTAssertTrue(true)
    } catch {
            XCTFail()
        }
    }

    func testMakeRequest() {
        
        let urlRequest = request.makeRequest().urlRequest
        
        XCTAssertEqual(urlRequest.httpMethod, "GET")
        XCTAssertNil(urlRequest.httpBody)
        XCTAssertEqual(urlRequest.url?.absoluteString, "\(URLPath().employeeData)")
    }
    
    func testExample() throws {
        // This is an example of a functional test case.
        // Use XCTAssert and related functions to verify your tests produce the correct results.
        // Any test you write for XCTest can be annotated as throws and async.
        // Mark your test throws to produce an unexpected failure when your test encounters an uncaught error.
        // Mark your test async to allow awaiting for asynchronous code to complete. Check the results with assertions afterwards.
    }

    func testPerformanceExample() throws {
        // This is an example of a performance test case.
        self.measure {
            // Put the code you want to measure the time of here.
        }
    }

}
