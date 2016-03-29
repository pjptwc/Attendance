//
//  StudentsViewController.swift
//  Attendence
//
//  Created by Pratikbhai Patel on 3/28/16.
//  Copyright © 2016 Pratikbhai Patel. All rights reserved.
//

import UIKit

class StudentsViewController: UIViewController {

    var studentsArray: [Student]? = [Student]()
    
    @IBOutlet weak var tableView: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.reloadData()
        // Do any additional setup after loading the view.
    }
    
    func reloadData() {
        self.studentsArray = DataProvider.sharedInstance.getStoredStudents()
        self.tableView.reloadData()
    }
    
    override func viewDidAppear(animated: Bool) {
        super.viewDidAppear(animated)
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func addButtonClicked(sender: AnyObject){
        
        let alertController = UIAlertController(title: "Add New Student", message: "Enter student's name", preferredStyle: UIAlertControllerStyle.Alert)
        
        let saveAction = UIAlertAction(title: "Save", style: UIAlertActionStyle.Default, handler: {
            alert -> Void in
            let nameTextField = alertController.textFields![0] as UITextField
            if let name = nameTextField.text where name != "" {
                let student = Student()
                student.name = nameTextField.text
                DataProvider.sharedInstance.storeStudent(student)
                self.reloadData()
            }
            
        })
        
        alertController.addTextFieldWithConfigurationHandler { (textField : UITextField!) -> Void in
            textField.placeholder = "Enter Student Name"
        }
    
        alertController.addAction(saveAction)
        
        self.presentViewController(alertController, animated: true, completion: nil)
    }
}


extension StudentsViewController: UITableViewDataSource {
    
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.studentsArray?.count ?? 0
    }
    
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        var cell = tableView.dequeueReusableCellWithIdentifier("cell")
        if cell == nil {
            cell = UITableViewCell(style: .Default, reuseIdentifier: "cell")
        }
        cell!.textLabel?.text = "\(self.studentsArray![indexPath.row].name!)"
        cell!.selectionStyle = .None
        return cell!
    }
}


extension StudentsViewController: UITableViewDelegate {
    
    func tableView(tableView: UITableView, didSelectRowAtIndexPath indexPath: NSIndexPath) {
        
    }
}
