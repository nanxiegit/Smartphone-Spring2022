//
//  ViewController.swift
//  Assignment3_XibFile
//
//  Created by Nan  Xie on 2/14/22.
//

import UIKit

class ViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {

    @IBOutlet weak var tblView: UITableView!
    
    let images = ["Seattle1","Seattle2", "Seattle3","Seattle4","Seattle5","Seattle6","Seattle7","Seattle8","Seattle9"]
    let imageLabel = ["Seattle1","Seattle2", "Seattle3","Seattle4","Seattle5","Seattle6","Seattle7","Seattle8","Seattle9"]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return images.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = Bundle.main.loadNibNamed("TableViewCell", owner: self, options: nil)?.first as! TableViewCell
        
        cell.imgvView.image = UIImage(named:images[indexPath.row])
        cell.lblImage.text = imageLabel[indexPath.row]
        
        return cell
    }

}

