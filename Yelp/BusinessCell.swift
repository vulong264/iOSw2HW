//
//  BusinessCell.swift
//  Yelp
//
//  Created by LVMBP on 2/23/17.
//  Copyright © 2017 CoderSchool. All rights reserved.
//

import UIKit
import AFNetworking

class BusinessCell: UITableViewCell {

    @IBOutlet weak var categoryLabel: UILabel!
    @IBOutlet weak var distanceLabel: UILabel!
    @IBOutlet weak var businessLabel: UILabel!
    @IBOutlet weak var businessImage: UIImageView!
    @IBOutlet weak var reviewImage: UIImageView!
    @IBOutlet weak var reviewCount: UILabel!
    @IBOutlet weak var addressLabel: UILabel!
    
    var business: Business! {
        didSet {
            addressLabel.text = business.address ?? ""
            categoryLabel.text = business.categories ?? ""
            distanceLabel.text = business.distance ?? ""
            businessLabel.text = business.name ?? ""
//            reviewCount.text = String(business.reviewCount)
            if (business.imageURL != nil) {
                businessImage.setImageWith(business.imageURL!)
            }
            if (business.ratingImageURL != nil){
                reviewImage.setImageWith(business.ratingImageURL!)    
            }
            
        }
    }
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
