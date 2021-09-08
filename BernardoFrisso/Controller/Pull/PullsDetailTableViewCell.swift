//
//  PullsDetailTableViewCell.swift
//  PullsDetailTableViewCell
//
//  Created by bernardo frisso on 08/09/21.
//

import UIKit

class PullsDetailTableViewCell: UITableViewCell {

    
//MARK: - IBOutlets
    
    @IBOutlet weak var pullName: UILabel!
    @IBOutlet weak var pullDescription: UILabel!
    @IBOutlet weak var userName: UILabel!
    @IBOutlet weak var userImage: UIImageView!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
}
