import UIKit
import XCTest

class calcUlatrTests: XCTestCase {
    // MARK: Tests
    
    func testCourseInit() {
        let potentialCourse = Course(name1: "CS111", categories1: [Category(name: "tests", weight:10)!, Category(name: "quizzes", weight:90)!])!
        XCTAssertNotNil(potentialCourse)
    }
    
    func testCourseInit3() {
        let potentialCourse = Course(name1: "CS111", categories1: [Category(name: "tests", weight:10)!, Category(name: "tests", weight:90)!])!
        XCTAssertNil(potentialCourse)
    }
    
    
}