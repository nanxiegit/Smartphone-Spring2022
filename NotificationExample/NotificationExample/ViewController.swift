//
//  ViewController.swift
//  NotificationExample
//
//  Created by Nan  Xie on 2/21/22.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var lblFirstName: UILabel!
    @IBOutlet weak var lblLastName: UILabel!
    
    deinit{
        NotificationCenter.default.removeObserver(self)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        substribeToNotifications()
        // Do any additional setup after loading the view.
    }

    @IBAction func gotoProfile(_ sender: Any) {
        performSegue(withIdentifier: "segueProfile", sender: self)
    }
    
    @IBAction func gotoFormEntry(_ sender: Any) {
        performSegue(withIdentifier: "segueFormEntry", sender: self)
    }
    
    func substribeToNotifications(){
        NotificationCenter.default.addObserver(self, selector: #selector(getName), name: nameNotif, object: nil)
    }
    
    @objc func getName(notif : NSNotification) {
        print("I am in getName func")
        
        if let dict = notif.userInfo as NSDictionary? {
            
            if let firstName = dict["FirstName"] as? String {
                lblFirstName.text = firstName
            }
            
            if let lastName = dict["LastName"] as? String {
                lblLastName.text = lastName
                
            }
        }
        
    }
}

