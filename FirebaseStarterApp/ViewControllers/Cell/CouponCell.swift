//
//  CouponCell.swift
//  FirebaseStarterApp
//
//  Created by Anshul on 18/12/19.
//  Copyright © 2019 Instamobile. All rights reserved.
//

import UIKit

class CouponCell: UITableViewCell {

    @IBOutlet weak var imagePartner: UIImageView!
    
    @IBOutlet weak var lblCoupAmount: UILabel!
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
}
