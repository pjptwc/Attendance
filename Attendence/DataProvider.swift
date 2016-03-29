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
    
    func getStoredDates() -> [Date]? {
        var returnArray: [Date]?
        
        if let dateData = NSData.init(contentsOfFile: self.filePathForFile(kDatesFilePath)) {
            returnArray = NSKeyedUnarchiver.unarchiveObjectWithData(dateData) as? [Date]
        }
        return returnArray
    }
    
    func getStoredStudents() -> [Student]? {
        let returnArray: [Student]? = nil
        
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
        
        let dateData = NSKeyedArchiver.archivedDataWithRootObject(storedDates!)
        do {
            try dateData.writeToFile(self.filePathForFile(kDatesFilePath), options: .DataWritingAtomic)
        } catch let error {
            print("Something went wrong when storing...\(error)")
        }
    }
    
    func storeStudent(student: Student) {
        var storedStudents = self.getStoredStudents()
        if storedStudents == nil {
            storedStudents = [Student]()
            storedStudents!.append(student)
        } else {
            storedStudents?.append(student)
        }
    }
    
    func filePathForFile(file: String) -> String {
        let documentsPath = NSSearchPathForDirectoriesInDomains(.DocumentDirectory, .UserDomainMask, true).first
        return documentsPath! + file
    }
}