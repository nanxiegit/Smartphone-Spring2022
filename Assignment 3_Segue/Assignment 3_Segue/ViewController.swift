//
//  ViewController.swift
//  Assignment 3_Segue
//
//  Created by Nan  Xie on 2/14/22.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var txtFirstName: UITextField!
    @IBOutlet weak var txtLastName: UITextField!
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }

    @IBAction func goToSecondVC(_ sender: Any) {
        performSegue(withIdentifier: "segueToSecond", sender: self)
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "segueToSecond"{
            let secondVC = segue.destination as! SecondViewController
            
            secondVC.welcomeStr = "Hello! \(txtFirstName.text!), \(txtLastName.text!)"
        }
    }

    
}

