//
//  ViewController.swift
//  FoodImages
//
//  Created by Nan  Xie on 2/7/22.
//

import UIKit

class ViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {

    
    let images = ["burger","fried_chicken","pizza","steak","taco","pasta", "fried_rice","dumpling","kalbi","tonkatsu","salmon","dessert"]
    let imageNames = ["Burger","Fried Chicken","Pizza","Steak","Taco","Pasta", "Fried Rice","Dumpling","Kalbi","Tonkatsu","Salmon","Dessert"]
    
    @IBOutlet weak var tblView: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        tblView.delegate = self
        tblView.dataSource = self
        // Do any additional setup after loading the view.
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return images.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier:"cell", for:indexPath) as! TableViewCell
        
        cell.imgViewCell.image = UIImage(named:images[indexPath.row])
        cell.lblCell.text = imageNames[indexPath.row]
        
        return cell
    }
    


}

