//
//  TableViewController.swift
//  TableViewControllerExample
//
//  Created by Nan  Xie on 2/7/22.
//

import UIKit

/*
 1. Remove view controller from storyboard and remove code
 2. Add a TableViewController to the storyboard and add 'cell' as reusable indentifier
 3. Make the tableview as initial VC
 4. Add TableViewController Code file and map UI and Code file
 5. Rmove boiler plate code and have 2 functions numberOfRowsInsections and cellForRowAt
 6. Add array and return arr.count in numberOfRowsInsection
 7. Return the cell (configure cell to use the array)
 */

class TableViewController: UITableViewController {
    
    let arr = ["XIE", "WANG", "JIANG"]
    override func viewDidLoad() {
        super.viewDidLoad()
    }

    // MARK: - Table view data source

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return arr.count
    }

    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath)

        // Configure the cell...
        cell.textLabel?.text = arr[indexPath.row]
        
        return cell
    }

}
