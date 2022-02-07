//
//  ViewController.swift
//  CustomTableViewCell
//
//  Created by Nan  Xie on 2/7/22.
//

import UIKit

class ViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {

    let arr = ["Seattle1", "Seattle2", "Seattle3"]
    
    let imgNames = ["i1","i2", "i3"]
    @IBOutlet weak var tblView: UITableView!
    override func viewDidLoad() {
        super.viewDidLoad()
        tblView.delegate = self
        tblView.dataSource = self
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return arr.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath) as! TableViewCell
        cell.imgView.image = UIImage(named: arr[indexPath.row])
        cell.lblCell.text = imgNames[indexPath.row]
        

        return cell
    }
    


}

