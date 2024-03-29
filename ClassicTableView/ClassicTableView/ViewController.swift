//
//  ViewController.swift
//  ClassicTableView
//
//  Created by Nan  Xie on 2/7/22.
//

import UIKit
/*
 1. Add a Table view to the story board
 2. Add a table view cell to the table view
 3. Create identifier for table view cell and cell it cell
 4. Create outlet of tableview to the code call the table view as 'tblView'
 5. Add protocols UITableViewDelegate, UITableViewDataSource to the class
 6. Add functions for table view numberOfRowsInsection and cellForRowAt
 7. In view did load add tblView.delegate = self and tblView.dataSource = self
 8. Create an array for data values
 9. return array.count in numberOfRowsInsection function
 10. fill the cellForRowAt function
 
 */

class ViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {

    @IBOutlet weak var tblView: UITableView!
    
    let arr = ["xie", "wang", "roro", "momo", "lisa"]
    override func viewDidLoad() {
        super.viewDidLoad()
        tblView.delegate = self
        tblView.dataSource = self
        // Do any additional setup after loading the view.
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return arr.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
            let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath)
            cell.textLabel?.text = arr[indexPath.row]
            return cell
    }
    


}

