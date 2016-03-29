//
//  DataProvider.swift
//  Attendence
//
//  Created by Pratikbhai Patel on 3/28/16.
//  Copyright © 2016 Pratikbhai Patel. All rights reserved.
//

import Foundation

// SINGLETON

let kDates = "StoredDates"
let kStudents = "StoredStudents"

let kDatesFilePath = "datesFile.dat"
let kStudentsFilePath = "studentsFile.dat"

class DataProvider {

    static let sharedInstance = DataProvider()
    
    var datesFilePath: String {
        return NSSearchPathForDirectoriesInDomains(.DocumentDirectory, .UserDomainMask, true).first! + kDatesFilePath
    }
    
    var studentsFilePath: String {
        return NSSearchPathForDirectoriesInDomains(.DocumentDirectory, .UserDomainMask, true).first! + kStudentsFilePath
    }
    
    func getStoredDates() -> [Date]? {
        var returnArray: [Date]? = nil
        
        if let dateData = NSData.init(contentsOfFile: self.datesFilePath) {
            returnArray = NSKeyedUnarchiver.unarchiveObjectWithData(dateData) as? [Date]
        }
        return returnArray
    }
    
    func getStoredStudents() -> [Student]? {
        var returnArray: [Student]?
        
        if let studentData = NSData.init(contentsOfFile: self.studentsFilePath) {
            returnArray = NSKeyedUnarchiver.unarchiveObjectWithData(studentData) as? [Student]
        }
        return returnArray
    }
    
    func storeDate(date: Date) {
        var storedDates = self.getStoredDates()
        if storedDates == nil {
            storedDates = [Date]()
            storedDates!.append(date)
        } else {
            storedDates?.append(date)
        }
        NSKeyedArchiver.archiveRootObject(storedDates!, toFile: self.datesFilePath)
    }
    
    func storeStudent(student: Student) {
        var storedStudents = self.getStoredStudents()
        if storedStudents == nil {
            storedStudents = [Student]()
            storedStudents!.append(student)
        } else {
            storedStudents?.append(student)
        }
        NSKeyedArchiver.archiveRootObject(storedStudents!, toFile: self.studentsFilePath)
    }
}