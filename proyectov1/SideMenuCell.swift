//
//  SideMenuCell.swift
//  SideMenuProyectoEG
//
//  Created by DAMII on 8/11/23.
//

import UIKit

class SideMenuCell: UITableViewCell {

    class var identifier: String { return String(describing: self) }
        class var nib: UINib { return UINib(nibName: identifier, bundle: nil) }
        
        
        
    @IBOutlet var titleLabel: UILabel!
    @IBOutlet var iconImageView: UIImageView!
    
    
        override func awakeFromNib() {
            super.awakeFromNib()
            
            // Background
            self.backgroundColor = .clear
            
            // Icon
            self.iconImageView.tintColor = .white
            
            // Title
            self.titleLabel.textColor = .white
        }
    
}
