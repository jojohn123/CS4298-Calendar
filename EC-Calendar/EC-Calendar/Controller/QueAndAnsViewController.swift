//
//  QueAndAnsViewController.swift
//  EC-Calendar
//
//  Created by LAM Chun Kit on 1/4/2019.
//  Copyright © 2019 Group8. All rights reserved.
//

import UIKit

class QueAndAnsViewController: UIViewController, UITableViewDataSource, UITableViewDelegate {

    @IBOutlet var tableView: UITableView!
    let questionSet = QuestionSet()
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return questionSet.questions.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        if let cell = tableView.dequeueReusableCell(withIdentifier: "questionCell", for: indexPath) as? QuestionTableViewCell {
            cell.configureCell(question: questionSet.questions[indexPath.row])
            return cell
        }
        return UITableViewCell()
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 87
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.delegate = self
        tableView.dataSource = self
    }
}
