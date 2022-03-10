//
//  StockViewController.swift
//  StockMaster
//
//  Created by Nan  Xie on 3/9/22.
//

import UIKit
import RealmSwift


class StockViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        
        loadStockValues()
        
//        print(Realm.Configuration.defaultConfiguration.fileURL?.path)

        // Do any additional setup after loading the view.
    }
    
    @IBAction func addDBAction(_ sender: Any) {
        
        let stock = StockShort()
//        stock.symbol = "TSLA"
        stock.symbol = "AAPL"
        stock.price = 915.23
        stock.volume = 23452244
        
        do{
            let realm = try Realm()
            try realm.write({
                realm.add(stock, update: .modified)
            })
        }catch{
            print("Error in writing to DB")
            
        }
    }
    
    func loadStockValues(){
        do {
            let realm = try Realm()
            let stocks = realm.objects(StockShort.self)
            for stock in stocks{
                print(stock.symbol)
            }
            
        }catch{
            print("Error in reading DB")
            
        }
    }
    
    func getTslaStock() -> StockShort{
        do {
            let realm = try Realm()
            let stocks = realm.objects(StockShort.self)
            for stock in stocks{
                if stock.symbol == "TSLA"{
                    return stock
                }
            }

            
        }catch{
            print("Error in reading DB")
            
        }
        
        return StockShort()
        
    }
    
    
    func deleteStockFromDB (stock: StockShort){
        do{
            let realm = try Realm()
            try realm.write({
                realm.delete(stock)
            })
        }catch{
            
        }
    }
    
    @IBAction func deleteTSLA(_ sender: Any) {
        let tsla = getTslaStock()
        deleteStockFromDB(stock: tsla)
    }
    
    
    func addStockToDB(symbol : String){
        
        let stock = StockShort()
        stock.symbol = symbol

        do{
            let realm = try Realm()
            try realm.write({
                realm.add(stock, update: .modified)
            })
        }catch{
            print("Error in writing to DB")
            
        }
        
    }
    
    @IBAction func addStockAction(_ sender: Any) {
        var txtField : UITextField?
        
        let alertController = UIAlertController(title: "Add Stock", message: "",
                                                     preferredStyle: .alert)
        let OKButton = UIAlertAction(title:"OK", style: .default){action in
            guard let symbol = txtField?.text else{
                return
            }
            self.addStockToDB(symbol: symbol)
        }
        
        let cancelButton = UIAlertAction(title:"Cancel", style: .cancel){action in }
        
        alertController.addAction(OKButton)
        alertController.addAction(cancelButton)
        
        alertController.addTextField{
            stockTextField in stockTextField.placeholder = "Type Stock Symbol"
            txtField = stockTextField
        }
        
        self.present(alertController, animated: true, completion: nil)
    }
}
