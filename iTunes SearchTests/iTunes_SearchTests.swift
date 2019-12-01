//
//  iTunes_SearchTests.swift
//  iTunes SearchTests
//
//  Created by Austin Potts on 11/28/19.
//  Copyright © 2019 Lambda School. All rights reserved.
//

import XCTest
@testable import iTunes_Search

// What should we test?
// Does decoding work?
// Does decoding fail when given bad data?
// Does it build the correct URL?
// Does it build the correct URL Request?
// Are the results saved properly?
// Is completion handler called if networking fails?
// Is scompletion handler called when data is bad?
// is the completion handler called when the data is correct?




class iTunes_SearchTests: XCTestCase {

   
    
    func testForSomeResults(){
        let mock = MockDataLoader()
        mock.data = goodResultsData
        
        //The real app is always going to use URL session.shared, but the test will use this mock data
        let controller = SearchResultController(dataLoader: mock)
        
        //Create the expectation
        let resultsExpectation = expectation(description: "wait for results")
        
        controller.performSearch(for: "GarageBand", resultType: .software) {
            //fulfill expectation
            resultsExpectation.fulfill()
        }
        
        //Wait for the expectation
        wait(for: [resultsExpectation], timeout: 2)
        //Now check results
        
        XCTAssertTrue(controller.searchResults.count == 2, "Expecting 2 results for GarageBand")
        XCTAssertEqual("GarageBand", controller.searchResults[0].title)
        XCTAssertEqual("Apple", controller.searchResults[0].artist)
    }

}
