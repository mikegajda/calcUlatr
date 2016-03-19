//
//  CourseTableViewController.swift
//  calcUlatr
//
//  Created by Mike Gajda on 3/19/16.
//  Copyright © 2016 Preference Digital. All rights reserved.
//

import UIKit

class CourseTableViewController: UITableViewController {
    
    // MARK: Properties
    
    var myCourses = [Course]()

    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Load the sample data.
        
        loadSampleCourses()

        // Uncomment the following line to preserve selection between presentations
        // self.clearsSelectionOnViewWillAppear = false

        // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
        // self.navigationItem.rightBarButtonItem = self.editButtonItem()
    }
    
    func loadSampleCourses() {
        let assign1 = Assignment(name: "final", possiblePts: 100.0, recvdPts: 100.0)
        let category1 = Category(name: "tests", weight: 100.0, assignments: [assign1!])!
        
        let course1 = Course(name1: "CS411", categories1: [category1])!
        
        
        let assign2 = Assignment(name: "final", possiblePts: 100.0, recvdPts: 100.0)
        let category2 = Category(name: "tests", weight: 100.0, assignments: [assign2!])!
        
        let course2 = Course(name1: "CS112", categories1: [category2])!
        print(course1.name)
        myCourses += [course1, course2]
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    // MARK: - Table view data source

    override func numberOfSectionsInTableView(tableView: UITableView) -> Int {
        
        return 1
    }

    override func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {

        return myCourses.count
    }


    override func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        // Table view cells are reused and should be dequeued using a cell identifier.
        let cellIdentifier = "CourseTableViewCell"
        
        let cell = tableView.dequeueReusableCellWithIdentifier(cellIdentifier, forIndexPath: indexPath) as! CourseTableViewCell
        
        let myCourse = myCourses[indexPath.row]
        cell.nameLabel.text = myCourse.name
        
        return cell
    }
    

    /*
    // Override to support conditional editing of the table view.
    override func tableView(tableView: UITableView, canEditRowAtIndexPath indexPath: NSIndexPath) -> Bool {
        // Return false if you do not want the specified item to be editable.
        return true
    }
    */

    /*
    // Override to support editing the table view.
    override func tableView(tableView: UITableView, commitEditingStyle editingStyle: UITableViewCellEditingStyle, forRowAtIndexPath indexPath: NSIndexPath) {
        if editingStyle == .Delete {
            // Delete the row from the data source
            tableView.deleteRowsAtIndexPaths([indexPath], withRowAnimation: .Fade)
        } else if editingStyle == .Insert {
            // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
        }    
    }
    */

    /*
    // Override to support rearranging the table view.
    override func tableView(tableView: UITableView, moveRowAtIndexPath fromIndexPath: NSIndexPath, toIndexPath: NSIndexPath) {

    }
    */

    /*
    // Override to support conditional rearranging of the table view.
    override func tableView(tableView: UITableView, canMoveRowAtIndexPath indexPath: NSIndexPath) -> Bool {
        // Return false if you do not want the item to be re-orderable.
        return true
    }
    */

    //MARK: - Navigation

    @IBAction func unwindToCourse(sender: UIStoryboardSegue) {
        if let sourceViewController = sender.sourceViewController as?
            AddCourseViewController, course = sourceViewController.course {
                let newIndexPath = NSIndexPath(forRow: myCourses.count, inSection: 0)
                print(course)
                myCourses.append(course)
                tableView.insertRowsAtIndexPaths([newIndexPath], withRowAnimation: .Bottom)
        }
    }
    

}
