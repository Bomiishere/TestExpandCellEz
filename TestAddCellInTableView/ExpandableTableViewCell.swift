//
//  ExpandableTableViewCell.swift
//  TestAddCellInTableView
//
//  Created by bomi.chen on 2020/7/1.
//  Copyright © 2020 bomi.chen. All rights reserved.
//

import UIKit

class ExpandableTableViewCell: UITableViewCell {
    
    @IBOutlet weak var squareView: UIView!
    @IBOutlet weak var addButton: UIButton!
    
    var didTappedAddButton: (()->())?
    
    @IBAction func addButtonDidTouchUpInside() {
        guard let action = didTappedAddButton else { return }
        action()
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
