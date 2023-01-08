//
//  MyTableViewCell.swift
//  HomeWork2
//
//  Created by Oguzhan Ozturk on 8.01.2023.
//

import UIKit

class MyTableViewCell: UITableViewCell {

    @IBOutlet weak var cellTitleLbl: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
}
