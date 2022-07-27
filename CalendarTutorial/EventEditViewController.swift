//
//  EventEditViewController.swift
//  CalendarTutorial
//
//  Created by Jessika Gerhardsson on 2022-07-26.
//

import UIKit

class EventEditViewController: UIViewController {
    
    
    @IBOutlet weak var nameTF: UITextField!
    
    @IBOutlet weak var datePicker: UIDatePicker!
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        datePicker.date = selectedDate
        
    }
    
    
    @IBAction func saveButton(_ sender: Any) {
        let newEvent = Event()
        newEvent.id = eventList.count
        newEvent.name = nameTF.text
        newEvent.date = datePicker.date
        
        eventList.append(newEvent)
        navigationController?.popViewController(animated: true)
        print("Save")
    }
    
}
