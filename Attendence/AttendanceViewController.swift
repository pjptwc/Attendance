//
//  ViewController.swift
//  Attendence
//
//  Created by Pratikbhai Patel on 3/28/16.
//  Copyright © 2016 Pratikbhai Patel. All rights reserved.
//

import UIKit

class AttendanceViewController: UIViewController {

    var datesArray: [Date]? = [Date]()
    @IBOutlet weak var tableView: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        self.reloadData()
    }
    
    func reloadData() {
        self.datesArray = DataProvider.sharedInstance.getStoredDates()
        self.tableView.reloadData()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    @IBAction func addNewDate(sender: AnyObject) {
        let newDate = Date()
        newDate.date = NSDate()
        DataProvider.sharedInstance.storeDate(newDate)
        self.reloadData()
    }
}

extension AttendanceViewController: UITableViewDataSource {
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return datesArray?.count ?? 0
    }
    
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        var cell = tableView.dequeueReusableCellWithIdentifier("cell")
        if cell == nil {
            cell = UITableViewCell(style: .Default, reuseIdentifier: "cell")
        }
        cell!.textLabel?.text = "\(self.datesArray![indexPath.row].date!)"
        cell!.selectionStyle = .None
        return cell!
    }
}


extension AttendanceViewController: UITableViewDelegate {
    
    func tableView(tableView: UITableView, didSelectRowAtIndexPath indexPath: NSIndexPath) {
        
    }
}
