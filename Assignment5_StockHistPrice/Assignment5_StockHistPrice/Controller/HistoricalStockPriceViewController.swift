//
//  HistoricalStockPriceViewController.swift
//  Assignment5_StockHistPrice
//
//  Created by Nan  Xie on 3/2/22.
//

import UIKit
import SwiftSpinner
import SwiftyJSON
import Alamofire

class HistoricalStockPriceViewController: UIViewController {
    
    @IBOutlet weak var txtStockSymbol: UITextField!
    
    @IBOutlet weak var txtHistDate: UITextField!
    
    @IBOutlet weak var lblStockPrice: UILabel!
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    

    @IBAction func GetStockPrice(_ sender: Any) {
        
        guard let symbol = txtStockSymbol.text?.uppercased() else {return}
        guard let histDate = txtHistDate.text else {return}

        
        let url = "\(stockHistURL)\(symbol)?from=\(histDate)&to=\(histDate)&apikey=\(apiKey)"
        
        print(url)
        
        SwiftSpinner.show("Getting Stock Value on \(histDate) for \(symbol)")
        
        AF.request(url).responseJSON{response in
            
            SwiftSpinner.hide(nil)
            
            if response.error != (nil) {
                print(response.error!)
                return
            }

            
            let stocks = JSON(response.data!)
            print(stocks["historical"][0]["date"])

            
            guard let stock = stocks.first else {return}
        
            print(stocks)
            print(stock)

            let histprice = StockHistPrice()
            histprice.symbol = stocks["symbol"].stringValue
            histprice.date = stocks["historical"][0]["date"].stringValue
            histprice.close = stocks["historical"][0]["close"].floatValue
            
            self.lblStockPrice.text = "\(histprice.symbol) on \(histprice.date): $ \(histprice.close)"

            
            
            
            
            
            
            
        }

 }
    
}


        
