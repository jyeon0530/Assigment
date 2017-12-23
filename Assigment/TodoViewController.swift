//
//  TodoViewController.swift
//  Assigment
//
//  Created by SWUCOMPUTER on 2017. 12. 21..
//  Copyright © 2017년 SWUCOMPUTER. All rights reserved.
//

import UIKit
import CoreData
import UserNotifications
import EventKit
class TodoViewController: UIViewController, UITextFieldDelegate , UIPickerViewDataSource, UIPickerViewDelegate{
    var pickOption = ["★", "★★", "★★★", "★★★★", "★★★★★"]
    var appDelegate = UIApplication.shared.delegate as? AppDelegate
    var lists: [NSManagedObject] = []
    let datePicker:UIDatePicker = UIDatePicker()
    @IBOutlet var labelInfo: UITextField!
    @IBOutlet var pickerTextfield: UITextField!
    @IBOutlet var todayDate: UILabel!
   
   

   
    func datePickerValueChanged(sender:UIDatePicker) {
        
        let Formatter = DateFormatter()
       Formatter.dateFormat = "yyyy-MM-dd"
        // Formatter.dateStyle = DateFormatter.Style.full
       // Formatter.timeStyle = DateFormatter.Style.none
        labelInfo.text = Formatter.string(from: sender.date)
        
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        let pickerView = UIPickerView()
       
        
        pickerView.delegate = self
        pickerView.dataSource = self
     
        pickerTextfield.inputView = pickerView
        
        let datePicker = UIDatePicker()
        let currentDate = Date()
        
        datePicker.minimumDate = currentDate
        datePicker.datePickerMode = UIDatePickerMode.date
        datePicker.addTarget(self, action: #selector(TodoViewController.datePickerValueChanged(sender:)), for: UIControlEvents.valueChanged)
        
        labelInfo.inputView = datePicker
        
        
        
        let today = NSDate() //현재 시각 구하기
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "yyyy-MM-dd"
        todayDate.text = dateFormatter.string(from: today as Date)
        
        
    
    }
    
    
    
    @IBOutlet var textDo: UITextField!
    
    override func viewDidAppear(_ animated: Bool) {
          }
    
    func getContext () -> NSManagedObjectContext {
        let appDelegate = UIApplication.shared.delegate as! AppDelegate
        return appDelegate.persistentContainer.viewContext }
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        textField.resignFirstResponder()
        return true
    }
    
    @IBAction func savePressed(_ sender: UIBarButtonItem) {
        let context = getContext()
        let entity = NSEntityDescription.entity(forEntityName: "List", in: context)
        let object = NSManagedObject(entity: entity!, insertInto: context)
        object.setValue(textDo.text, forKey: "todo")
        object.setValue(labelInfo.text, forKey: "date")
        object.setValue(pickerTextfield.text, forKey: "important")
        object.setValue(Date(), forKey: "savedate")
        
        do {
            try context.save()
            print("saved!")
        } catch let error as NSError {
            print("Could not save \(error), \(error.userInfo)")
        }
   
    
    
    }
    
    
    
    
    
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return 1
    }
    
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        return pickOption.count
    }
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        return pickOption[row]
    }
    func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
        pickerTextfield.text = pickOption[row]
    }
   
  

    


}

