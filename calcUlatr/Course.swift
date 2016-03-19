//
//  Course.swift
//  calcUlatr
//
//  Created by Mike Gajda on 3/19/16.
//  Copyright © 2016 Preference Digital. All rights reserved.
//

import UIKit

class Category {
    
//    // MARK: Properties
//    
    struct PropertyKey {
        static let nameKey = "name"
        static let weightKey = "weight"
        static let assignmentsKey = "assignments"
        
    }
    
    //MARK: Archiving Paths
    
    static let DocumentsDirectory = NSFileManager().URLsForDirectory(.DocumentDirectory, inDomains: .UserDomainMask).first!
    static let ArchiveURL = DocumentsDirectory.URLByAppendingPathComponent("categories")
    
    var name: String
    var weight: Double
    var assignments: [Assignment]
    var totalPossiblePts: Double
    var totalRecvdPts: Double
    
    init?(name:String = "", weight: Double = 0, assignments:[Assignment] = []) {
        self.name = name
        self.weight = weight
        self.assignments = assignments
        self.totalPossiblePts = 0.0
        self.totalRecvdPts = 0.0
        for a in self.assignments {
            self.totalPossiblePts += a.possiblePts
            self.totalRecvdPts += a.recvdPts
        
        }
    }
    
    //MARK: NSCoding
    
    func encodeWithCoder(aCoder: NSCoder) {
        aCoder.encodeObject(name,forKey:PropertyKey.nameKey)
        aCoder.encodeObject(weight, forKey: PropertyKey.weightKey)
        aCoder.encodeObject(assignments, forKey: PropertyKey.assignmentsKey)
        
        
    }
    
    required convenience init?(coder aDecoder: NSCoder) {
        let name = aDecoder.decodeObjectForKey(PropertyKey.nameKey) as! String
        let weight = aDecoder.decodeObjectForKey(PropertyKey.weightKey) as! Double
        let assignments = aDecoder.decodeObjectForKey(PropertyKey.assignmentsKey) as! [Assignment]
        
        self.init(name: name, weight: weight, assignments: assignments)
    }
    
    //var currentAvg: Double
    //  currentAvg = totalRecvdPts/totalPossiblePts
}

class Assignment {
    
    // MARK: Properties
    
    struct PropertyKey {
        static let nameKey = "name"
        static let possiblePtsKey = "possiblePts"
        static let recvdPtsKey = "recvdPts"
        
    }
    
    //MARK: Archiving Paths
    
    static let DocumentsDirectory = NSFileManager().URLsForDirectory(.DocumentDirectory, inDomains: .UserDomainMask).first!
    static let ArchiveURL = DocumentsDirectory.URLByAppendingPathComponent("assignments")

    
    var name: String
    var possiblePts: Double
    var recvdPts: Double
    
    init?(name: String = "", possiblePts: Double = 0, recvdPts: Double = 0){
        self.name = name
        self.possiblePts = possiblePts
        self.recvdPts = recvdPts
    }
    
    //MARK: NSCoding
    
    func encodeWithCoder(aCoder: NSCoder) {
        aCoder.encodeObject(name,forKey:PropertyKey.nameKey)
        aCoder.encodeObject(possiblePts, forKey: PropertyKey.possiblePtsKey)
        aCoder.encodeObject(recvdPts, forKey: PropertyKey.recvdPtsKey)
        
    }
    
    required convenience init?(coder aDecoder: NSCoder) {
        let name = aDecoder.decodeObjectForKey(PropertyKey.nameKey) as! String
        let possiblePts = aDecoder.decodeObjectForKey(PropertyKey.possiblePtsKey) as! Double
        let recvdPts = aDecoder.decodeObjectForKey(PropertyKey.recvdPtsKey) as! Double
        self.init(name: name, possiblePts: possiblePts, recvdPts: recvdPts)
    }
    
}

class Course: NSObject, NSCoding {
    // MARK: Properties
    
    struct PropertyKey {
        static let nameKey = "name"
        static let categoriesKey = "categories"
        
    }
    
    //MARK: Archiving Paths
    
    static let DocumentsDirectory = NSFileManager().URLsForDirectory(.DocumentDirectory, inDomains: .UserDomainMask).first!
    static let ArchiveURL = DocumentsDirectory.URLByAppendingPathComponent("courses")
    var name: String?
    var categories: [Category]
    
    // MARK: Initialization
    
    init?(name1: String = "", categories1: [Category] = []) {
        self.name = name1
        self.categories = categories1
        super.init()
        
        
        // check total weights add to 100
        var total_weights = 0.0
        
        for category: Category in categories {
            total_weights += category.weight
        }
        
        if total_weights != 100 {
            return nil
        }
        
        //check no names are the same
        var total_names = [String]()
        
        var dup_category = Bool()
        dup_category = false
        
        for mycategory in self.categories {
            if total_names.contains(mycategory.name) {
                dup_category = true
            }
            else {
                total_names.append(mycategory.name)
            }
        }
        
        if dup_category == true {
            return nil
        }
        
    }
    
    //MARK: NSCoding

    func encodeWithCoder(aCoder: NSCoder) {
        aCoder.encodeObject(name,forKey:PropertyKey.nameKey)
        aCoder.encodeObject(categories, forKey: PropertyKey.categoriesKey)
        
    }
    
    required convenience init?(coder aDecoder: NSCoder) {
        let name = aDecoder.decodeObjectForKey(PropertyKey.nameKey) as! String
        let categories = aDecoder.decodeObjectForKey(PropertyKey.categoriesKey) as! [Category]
        self.init(name1: name, categories1: categories)
    }
    
}
