//
//  AddCourseViewController.swift
//  calcUlatr
//
//  Created by Mike Gajda on 3/19/16.
//  Copyright © 2016 Preference Digital. All rights reserved.
//

import UIKit

class AddCourseViewController: UIViewController {
    
    var course: Course?
    
    @IBOutlet weak var courseNameField: UITextField!
    @IBOutlet weak var saveButton: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */
    

    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        if saveButton === sender {
            let name = courseNameField.text!
            let assign1 = Assignment(name: "final", possiblePts: 100.0, recvdPts: 100.0)
            let category1 = Category(name: "tests", weight: 100.0, assignments: [assign1!])!
            course = Course(name1: name, categories1: [category1])
            print(course!.name)
        }
        
    }

}
