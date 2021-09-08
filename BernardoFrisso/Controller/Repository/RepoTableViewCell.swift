//
//  RepoTableViewCell.swift
//  RepoTableViewCell
//
//  Created by bernardo frisso on 06/09/21.
//

import UIKit

class RepoTableViewCell: UITableViewCell {
//MARK: - IBoutlats
    @IBOutlet weak var userImage: UIImageView!
    @IBOutlet weak var descriptionRepository: UILabel!
    @IBOutlet weak var title: UILabel!
    @IBOutlet weak var username: UILabel!
    @IBOutlet weak var numberOfStars: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
}
