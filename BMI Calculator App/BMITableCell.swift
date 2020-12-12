//
//  BMITableCell.swift
//  BMI Calculator App
//
//  Created by Reda Mehali on 12/11/20.
//

import UIKit

class BMITableCell : UITableViewCell {
    
    @IBOutlet weak var weight: UILabel!
    @IBOutlet weak var height: UILabel!
    @IBOutlet weak var bmi: UILabel!
    @IBOutlet weak var date: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }
    
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
    }
}
