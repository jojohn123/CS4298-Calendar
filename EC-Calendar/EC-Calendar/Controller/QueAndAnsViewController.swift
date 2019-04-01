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
    var questionToPass: String!
    var answerToPass: String!
    
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
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        questionToPass = questionSet.questions[indexPath.row].question
        answerToPass = questionSet.answers[indexPath.row].question
        performSegue(withIdentifier: "toAnswerSelection", sender: self)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.delegate = self
        tableView.dataSource = self
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if let answerVC = segue.destination as? AnswerViewController {
            answerVC.selectedQuestion = self.questionToPass
            answerVC.selectedAnswer = self.answerToPass
            
        }
    }
}
