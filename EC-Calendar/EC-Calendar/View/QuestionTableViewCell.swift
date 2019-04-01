//
//  QuestionTableViewCell.swift
//  EC-Calendar
//
//  Created by LAM Chun Kit on 1/4/2019.
//  Copyright © 2019 Group8. All rights reserved.
//

import UIKit

class QuestionTableViewCell: UITableViewCell {

    @IBOutlet var questionBox: UITextField!
//    @IBOutlet var button: UIButton!
    override func awakeFromNib() {
        super.awakeFromNib()
        questionBox.backgroundColor = UIColor.black
        questionBox.layer.cornerRadius = 10
//        button.setTitle("Click Here", for: .normal)
    }
    
    func configureCell(question: Question) {
        questionBox.text = question.question
    }

}
