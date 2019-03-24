//
//  DiaryViewController.swift
//  EC-Calendar
//
//  Created by Trevor Wong on 22/3/2019.
//  Copyright © 2019 Group8. All rights reserved.
//


import UIKit

class DiaryViewController: UIViewController, UITextFieldDelegate {
    
    var thisDateKey = ""
    var titleKey = ""
    var contentKey = ""
    @IBOutlet weak var dateOfThisDay: UILabel!
    @IBOutlet weak var titleTexField: UITextField!
    @IBOutlet weak var contentText: UITextView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.titleKey = thisDateKey + "title"
        self.contentKey = thisDateKey + "content"
        if let titleText = UserDefaults.standard.object(forKey: titleKey ) as? String {
            self.titleTexField.text = titleText
        }
        if let contentText = UserDefaults.standard.object(forKey: contentKey ) as? String {
            self.contentText.text = contentText
        } else {
            self.contentText.text = "enter your diary here"
        }
        dateOfThisDay.text = thisDateKey
        
        self.titleTexField.delegate = self
//        print(thisDateKey)
        // Do any additional setup after loading the view.
    }
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        self.view.endEditing(true)
        return false
    }
    
//    @IBAction func onSave(_ sender: Any) {
//        let titleString = titleTexField.text ?? "Untitled"
//        let contentString = contentText.text ?? "enter your diary here"
//        UserDefaults.standard.set(titleString , forKey: self.titleKey)
//        UserDefaults.standard.set(contentString , forKey: self.contentKey)
//    }
    
    @IBAction func onDonePressed(_ sender: Any) {
        let titleString = titleTexField.text ?? "Untitled"
        let contentString = contentText.text ?? "enter your diary here"
        UserDefaults.standard.set(titleString , forKey: self.titleKey)
        UserDefaults.standard.set(contentString , forKey: self.contentKey)
        self.view.endEditing(true)
        let alert = UIAlertController(title: "Alert", message: "Diary has been saved", preferredStyle: .alert)
        alert.addAction(UIAlertAction(title: "Okay", style: .default, handler: nil))
        self.present(alert, animated: true)
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
