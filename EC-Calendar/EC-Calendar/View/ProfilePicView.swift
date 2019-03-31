//
//  ProfilePicView.swift
//  EC-Calendar
//
//  Created by Trevor Wong on 31/3/2019.
//  Copyright © 2019 Group8. All rights reserved.
//

import UIKit

class ProfilePicView: UIImageView {
    override func awakeFromNib() {
        layer.borderWidth = 1
        layer.cornerRadius = self.frame.size.width / 2
        clipsToBounds = true
    }
   

}
