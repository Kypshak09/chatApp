//
//  MessageCell.swift
//  chatApp
//
//  Created by Amir Zhunussov on 05.12.2022.
//

import UIKit

class MessageCell: UITableViewCell {

    @IBOutlet weak var dateOfMessage: UILabel!
    @IBOutlet weak var messageBubble: UIView!
    @IBOutlet weak var label: UILabel!
    @IBOutlet weak var rightImageView: UIImageView!
    @IBOutlet weak var leftImageView: UIImageView!
    
    
    var currentDate = CurrentDate()
    
    override func awakeFromNib() {
        super.awakeFromNib()
        
        messageBubble.layer.cornerRadius = messageBubble.frame.size.height / 5
        dateOfMessage.text! = currentDate.date
        
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
        
    }
    
}
