//
//  Student.swift
//  Attendence
//
//  Created by Pratikbhai Patel on 3/28/16.
//  Copyright © 2016 Pratikbhai Patel. All rights reserved.
//

import Foundation

class Student: NSObject, NSCoding {
    var name: String?
    var attendenceRecord: [Double: Bool] = [0 : false]
    
    override init() {
        super.init()
    }
    
    func encodeWithCoder(aCoder: NSCoder) {
        if let name = self.name {
            aCoder.encodeObject(name, forKey: "name")
        }
        aCoder.encodeObject(attendenceRecord, forKey: "attendenceRecord")
        
    }
    
    required init?(coder aDecoder: NSCoder) {
        if let name = aDecoder.decodeObjectForKey("name") as? String {
            self.name = name
        }
        if let attendenceRecord = aDecoder.decodeObjectForKey("attendenceRecord") as? [Double : Bool] {
            self.attendenceRecord = attendenceRecord
        }
        super.init()
    }
    
}