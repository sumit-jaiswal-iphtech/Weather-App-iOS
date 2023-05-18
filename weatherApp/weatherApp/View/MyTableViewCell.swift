//
//  MyTableViewCell.swift
//  weatherApp
//
//  Created by iPHTech 29 on 17/05/23.
//

import UIKit

class MyTableViewCell: UITableViewCell {

    @IBOutlet weak var amazonImage: UIImageView!
    @IBOutlet weak var amazonlinkLbl: UILabel!
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
