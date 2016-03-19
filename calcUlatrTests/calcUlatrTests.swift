import UIKit
import XCTest

class calcUlatrTests: XCTestCase {
    // MARK: Tests
    
    func testCourseInit() {
        let potentialCourse = Course(name: "CS111", categories: [Category(name: "tests", weight:10), Category(name: "quizzes", weight:90)])
        XCTAssertNotNil(potentialCourse)
    }
    
    func testCourseInit3() {
        let potentialCourse = Course(name: "CS111", categories: [Category(name: "tests", weight:10), Category(name: "tests", weight:10)])
        XCTAssertNil(potentialCourse)
    }
    
    
}