//
//  DiaryViewController.swift
//  EC-Calendar
//
//  Created by Trevor Wong on 22/3/2019.
//  Copyright © 2019 Group8. All rights reserved.
//


import UIKit

class DiaryViewController: UIViewController {
    
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
//        print(thisDateKey)
        // Do any additional setup after loading the view.
    }
    
    @IBAction func onSave(_ sender: Any) {
        let titleString = titleTexField.text ?? "Untitled"
        let contentString = contentText.text ?? "enter your diary here"
        UserDefaults.standard.set(titleString , forKey: self.titleKey)
        UserDefaults.standard.set(contentString , forKey: self.contentKey)
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
