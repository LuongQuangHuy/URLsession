//
//  CustomCellTableViewCell.swift
//  URLsessionGetDataFromJSON
//
//  Created by Luong Quang Huy on 5/25/20.
//  Copyright © 2020 Luong Quang Huy. All rights reserved.
//

import UIKit



class CustomCellTableViewCell: UITableViewCell {
    @IBOutlet weak var title: UILabel!
    @IBOutlet weak var tags: UILabel!
    @IBOutlet weak var answerCount: UILabel!
    @IBOutlet weak var score: UILabel!
    @IBOutlet weak var link: UILabel!
    override func awakeFromNib() {
        super.awakeFromNib()
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
}
