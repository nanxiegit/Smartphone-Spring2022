//
//  GetNameViewController.swift
//  ProtocolAndDelegate
//
//  Created by Nan  Xie on 2/21/22.
//

import UIKit

protocol SendfirstAndLastNameDelegate {
    func setFirstAndLastName(firstName : String, lastName : String)
    func setWelcomeText (welcomeText : String)
}

class GetNameViewController: UIViewController {
    
    var firstName : String?
    var lastName : String?
    
    var sendMessageDelegate : SendMessageDelegate?
    
    var sendFirstAndLastNameDelegate : SendfirstAndLastNameDelegate?
    
    @IBOutlet weak var txtFirstName: UITextField!
    
    @IBOutlet weak var txtLastName: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        guard let firstName = firstName else {return}
        guard let lastName = lastName else {return}
        
        txtFirstName.text = firstName
        txtLastName.text = lastName


        // Do any additional setup after loading the view.
    }
    

    @IBAction func saveName(_ sender: Any) {
        guard let first = txtFirstName.text else {return}
        guard let last = txtLastName.text else {return}
        
        //sendMessageDelegate?.sendMessage(message: "Welcome \(first) \(last)")
        
        sendFirstAndLastNameDelegate?.setFirstAndLastName(firstName: first, lastName: last)
        sendFirstAndLastNameDelegate?.setWelcomeText(welcomeText: "Welcome Back \(first) \(last)")

        
        self.navigationController?.popViewController(animated: true)
    }
}
