//
//  EasyUserDefaultTests.swift
//  EasyUserDefaultTests
//
//  Created by Vincent Lin on 2018/6/23.
//  Copyright © 2018 Vincent Lin. All rights reserved.
//

import XCTest
@testable import EasyUserDefault

class EasyUserDefaultTests: XCTestCase {
    
    func testUserDefault() {
        var object = EasyUserDefault(key: "Test")
        print("object: \(object)")
        object.store("TestString")
        print("object: \(object)")
        object.store(142)
        print("object: \(object)")
        
        var object2 = UserDefaults.standard["Test2"]
        let dict: [String: Any] = ["age" : 28, "name" : "Serina", "weight" : 52]
        object2.store(dict)
        let storedDict = object2.storedRawValue() as! [String: Any]
        XCTAssertTrue(storedDict.count == dict.count)
        let dictionaryValue = object2.dictionaryValue
        XCTAssertTrue(dictionaryValue.count == dict.count)
        
        var object3 = EasyUserDefault(key: "Test3")
        let array: [String] = ["Iggy", "Ariana", "Nicky"]
        object3.store(array)
        let storedArray = object3.storedRawValue() as! [String]
        XCTAssertTrue(storedArray.count == array.count)
        let arrayValue = object3.arrayValue
        XCTAssertTrue(arrayValue.count == array.count)
        
        var object4 = EasyUserDefault(key: "Test4")
        XCTAssertFalse(object4.exist())
        XCTAssertTrue(object3.exist())
        object3.clean()
        XCTAssertFalse(object4.exist())
        
        var object5 = EasyUserDefault(key: "Test5")
        object5.store(true)
        let storedBool = object5.storedRawValue() as! Bool
        XCTAssertTrue(storedBool)
        
        var object6 = EasyUserDefault.init(key: "Test6")
        print("object6: \(object6)")
    }
    
    override func setUp() {
        super.setUp()
        // Put setup code here. This method is called before the invocation of each test method in the class.
    }
    
    override func tearDown() {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
        super.tearDown()
    }
    
    func testExample() {
        // This is an example of a functional test case.
        // Use XCTAssert and related functions to verify your tests produce the correct results.
    }
    
    func testPerformanceExample() {
        // This is an example of a performance test case.
        self.measure {
            // Put the code you want to measure the time of here.
        }
    }
    
}
