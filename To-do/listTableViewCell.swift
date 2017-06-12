//
//  listTableViewCell.swift
//  To-do
//
//  Created by Ameya Vichare on 05/06/17.
//  Copyright © 2017 vit. All rights reserved.
//

import UIKit

class listTableViewCell: UITableViewCell {
    @IBOutlet weak var backView: UIView!
    
    @IBOutlet weak var checkLabel: UILabel!
    
    @IBOutlet weak var checkButton: UIButton!
    
    @IBAction func check(_ sender: Any) {
        
        checkButton.setImage(#imageLiteral(resourceName: "squaredone"), for: .normal)
    }
}
