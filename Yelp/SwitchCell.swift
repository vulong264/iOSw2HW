//
//  SwitchCell.swift
//  Yelp
//
//  Created by LVMBP on 2/23/17.
//  Copyright © 2017 CoderSchool. All rights reserved.
//

import UIKit
protocol SwitchCellDelegate {
    func switchCell(switchCell: SwitchCell, didChangeValue value: Bool)
}
class SwitchCell: UITableViewCell {
    var isDealCell = false
    var cruisineCode = ""
    @IBOutlet weak var categoryLabel: UILabel!
    
    @IBOutlet weak var switchButton: UISwitch!
    
    var delegate: SwitchCellDelegate!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    func setDealCell(){
        isDealCell = true
    }
    
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

    @IBAction func onChange(_ sender: UISwitch) {
//        print("Switch changed to \(sender.isOn)")
        delegate.switchCell(switchCell: self, didChangeValue: sender.isOn)
    }
}
