//
//  CellConfig.swift
//  TestAddCellInTableView
//
//  Created by bomi.chen on 2020/7/1.
//  Copyright © 2020 bomi.chen. All rights reserved.
//

import UIKit

class CellConfig: NSObject {
    let color: UIColor
    let cellHeight: CGFloat
    
    init(color: UIColor, cellHeight: CGFloat) {
        self.color = color
        self.cellHeight = cellHeight
    }
    
}
