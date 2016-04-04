//
//  RecordViewController.swift
//  Attendence
//
//  Created by Pratikbhai Patel on 3/29/16.
//  Copyright © 2016 Pratikbhai Patel. All rights reserved.
//

import UIKit

private let kRecordCellIdentifer = "RecordCellIdentifier"

class RecordViewController: UIViewController {

    var date: Date? {
        didSet {
            self.intDate = date?.date?.timeIntervalSince1970
        }
    }
    
    var intDate: Double? = 0
    
    var studentsArray: [Student]? {
        return DataProvider.sharedInstance.getStoredStudents()
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
}

extension RecordViewController: UITableViewDataSource {
    
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return studentsArray?.count ?? 0
    }
    
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCellWithIdentifier(kRecordCellIdentifer) as! RecordTableViewCell
        cell.date = self.intDate
        cell.student = studentsArray?[indexPath.row]
        cell.selectionStyle = .None
        cell.delegate = self
        return cell
    }
    
}

extension RecordViewController: RecordProtocol {
    func saveRecord() {
        DataProvider.sharedInstance.saveRecords(self.studentsArray!)
    }
}