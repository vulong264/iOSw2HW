//
//  SelectCell.swift
//  Yelp
//
//  Created by LVMBP on 2/27/17.
//  Copyright © 2017 CoderSchool. All rights reserved.
//

import UIKit
protocol SelectCellDelegate {
    func selectCell(selectCell: SelectCell, isSelected value: Bool)
}
class SelectCell: UITableViewCell {
    var delegate: SelectCellDelegate!
    @IBOutlet weak var valueLabel: UILabel!
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
        delegate.selectCell(selectCell: self, isSelected: true)
        // Configure the view for the selected state
    }

}
