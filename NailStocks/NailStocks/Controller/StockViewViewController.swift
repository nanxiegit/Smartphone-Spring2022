//
//  StockViewViewController.swift
//  NailStocks
//
//  Created by Nan  Xie on 3/2/22.
//

import UIKit
import SwiftyJSON
import SwiftSpinner
import Alamofire

class StockViewViewController: UIViewController {

    @IBOutlet weak var txtStockSymbol: UITextField!
    
    @IBOutlet weak var lblStockPrice: UILabel!
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    

    @IBAction func getStockPrice(_ sender: Any) {
        
        guard let symbol = txtStockSymbol.text?.uppercased() else {return}
        
        let url = "\(shortQuoteURL)\(symbol)?apikey=\(apiKey)"
        
        SwiftSpinner.show("Getting Stock Value for \(symbol)")
        
        AF.request(url).responseJSON { response in
            SwiftSpinner.hide(nil)
            
            if response.error != nil{
                print(response.error!)
                return
            }
            // if i am here i get data
            let stocks = JSON(response.data!).array
            
            guard let stock = stocks!.first else {return}
            
            
            let quote = QuoteShort()
            quote.symbol = stock["symbol"].stringValue
            quote.price = stock["price"].floatValue
            quote.volume = stock["volume"].intValue
            
            self.lblStockPrice.text = "\(quote.symbol): \(quote.price) $"

            
            
 
            
            
        }
        
        
            }
    
}
