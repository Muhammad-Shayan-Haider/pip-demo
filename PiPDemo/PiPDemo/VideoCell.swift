//
//  VideoCell.swift
//  PiPDemo
//
//  Created by Muhammad Shayan on 04/04/2022.
//

import UIKit

class VideoCell: UITableViewCell {
    
    @IBOutlet weak var videoNameLbl: UILabel!
    @IBOutlet weak var thumbNailView: UIImageView!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    func configure(text: String, image: UIImage) {
        videoNameLbl.text = text
        thumbNailView.image = image
    }
    
}
