//
//  RecordTableViewCell.swift
//  Attendence
//
//  Created by Pratikbhai Patel on 4/1/16.
//  Copyright © 2016 Pratikbhai Patel. All rights reserved.
//

import UIKit

protocol RecordProtocol: class {
    func saveRecord()
}

class RecordTableViewCell: UITableViewCell {

    weak var delegate: RecordProtocol?
    
    var student: Student? {
        didSet {
            self.studentNameLabel.text = student?.name
            guard let someStudent = self.student,
                let present = someStudent.attendenceRecord[self.date!] else {
                    self.attendanceSwitch.setOn(false, animated: false)
                    return
            }
            
            self.attendanceSwitch.setOn(present, animated: false)
        }
    }
    
    var date: Double?
    
    @IBOutlet weak var studentNameLabel: UILabel!
    @IBOutlet weak var attendanceSwitch: UISwitch!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
        self.studentNameLabel.text = nil
        guard let someStudent = self.student,
            let present = someStudent.attendenceRecord[self.date!] else {
                self.attendanceSwitch.setOn(false, animated: false)
                return
        }
        
        self.attendanceSwitch.setOn(present, animated: false)
    }
    
    override func prepareForReuse() {
        super.prepareForReuse()
        self.studentNameLabel.text = nil
        self.attendanceSwitch.setOn(false, animated: false)
    }
    
    @IBAction func recordSwitchChanged(sender: UISwitch) {
        student!.attendenceRecord[self.date!] = sender.on
        self.delegate?.saveRecord()
    }

}
