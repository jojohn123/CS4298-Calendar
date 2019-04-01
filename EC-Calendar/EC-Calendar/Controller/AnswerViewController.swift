//
//  AnswerViewController.swift
//  EC-Calendar
//
//  Created by Trevor Wong on 1/4/2019.
//  Copyright © 2019 Group8. All rights reserved.
//

import UIKit

class AnswerViewController: UIViewController {
    
    @IBOutlet weak var questionLabel: UILabel!
    @IBOutlet weak var answerLabel: UITextView!
    
    var selectedQuestion: String!
    var selectedAnswer: String!

    override func viewDidLoad() {
        super.viewDidLoad()
        questionLabel.text = selectedQuestion
        answerLabel.text = selectedAnswer
        // Do any additional setup after loading the view.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
