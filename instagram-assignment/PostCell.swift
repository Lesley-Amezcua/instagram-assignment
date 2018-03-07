//
//  PostCell.swift
//  instagram-assignment
//
//  Created by lesley amezcua on 2/27/18.
//  Copyright © 2018 lesley amezcua. All rights reserved.
//

import UIKit
import ParseUI
class PostCell: UITableViewCell {

    @IBOutlet weak var postLabel: UILabel!
    @IBOutlet weak var photoImageView: PFImageView!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
