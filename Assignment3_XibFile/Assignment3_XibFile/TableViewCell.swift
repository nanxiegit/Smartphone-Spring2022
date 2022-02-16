//
//  TableViewCell.swift
//  Assignment3_XibFile
//
//  Created by Nan  Xie on 2/15/22.
//

import UIKit

class TableViewCell: UITableViewCell {

    @IBOutlet weak var imgvView: UIImageView!
    @IBOutlet weak var lblImage: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
}
