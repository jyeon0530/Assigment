//
//  DetailViewController.swift
//  Assigment
//
//  Created by SWUCOMPUTER on 2017. 12. 22..
//  Copyright © 2017년 SWUCOMPUTER. All rights reserved.
//

import UIKit
import CoreData
class DetailViewController: UIViewController {
    @IBOutlet var textDate: UITextField!
    @IBOutlet var textTodo: UITextField!
    @IBOutlet var saveDate: UITextField!
    @IBOutlet var textImportant: UITextField!
   
    var detailList: NSManagedObject?
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        if let list = detailList {
            textDate.text = list.value(forKey: "date") as? String
            textTodo.text = list.value(forKey: "todo") as? String
            textImportant.text = list.value(forKey: "important") as? String
            let dbDate: Date? = list.value(forKey: "savedate") as? Date
            let formatter: DateFormatter = DateFormatter()
            formatter.dateFormat = "yyyy-MM-dd h:mm a"
            if let unwrapDate = dbDate {
                let displayDate = formatter.string(from: unwrapDate as Date)
            saveDate.text = displayDate
            } }
        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
