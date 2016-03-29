//
//  Date.swift
//  Attendence
//
//  Created by Pratikbhai Patel on 3/28/16.
//  Copyright © 2016 Pratikbhai Patel. All rights reserved.
//

import Foundation

class Date: NSObject, NSCoding {
    var date: NSDate?
    
    override init() {
        super.init()
    }
    
    func encodeWithCoder(aCoder: NSCoder) {
        if let date = self.date {
            aCoder.encodeObject(date, forKey: "date")
        }
    }
    
    required init?(coder aDecoder: NSCoder) {
        if let date = aDecoder.decodeObjectForKey("date") as? NSDate {
            self.date = date
        }
        super.init()
    }
}