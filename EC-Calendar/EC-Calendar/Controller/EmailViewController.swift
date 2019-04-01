//
//  EmailViewController.swift
//  EC-Calendar
//
//  Created by WONG Chun Yan on 24/3/2019.
//  Copyright © 2019 Group8. All rights reserved.
//

import UIKit
import MessageUI

class EmailViewController: UIViewController,UITextViewDelegate, MFMailComposeViewControllerDelegate {

    @IBOutlet weak var name: UITextField!
    @IBOutlet weak var emailAddress: UITextField!
    @IBOutlet weak var textInput: UITextView!
    
//    @IBAction func dismissKeyboard(_ sender: Any) {
//        self.resignFirstResponder()
//    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.navigationItem.title = "Email Us"
        self.name.delegate = self as? UITextFieldDelegate
        self.emailAddress.delegate = self as? UITextFieldDelegate
        self.textInput.delegate = self
    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        self.view.endEditing(true)
    }

    @IBAction func sendEmail(_ sender: UIButton) {
        if MFMailComposeViewController.canSendMail() {
            let mc = MFMailComposeViewController()
            mc.mailComposeDelegate = self
            let recipients = ["test123@xxx.com.hk"]
            mc.setToRecipients(recipients)
            mc.setSubject(name.text! + " - my app")
            mc.setMessageBody("<p>Name: \(name.text!)</p><p>Email: \(emailAddress.text!)</p><p>Message: \(textInput.text!)</p>", isHTML: true)
            self.present(mc, animated: true)
        } else {
            print("Cannot send email!")
        }
    }
    
    func mailComposeController(_ controller: MFMailComposeViewController, didFinishWith result: MFMailComposeResult, error: Error?) {
        switch result {
        case MFMailComposeResult.cancelled:
            print("Mail cancelled")
        case MFMailComposeResult.saved:
            print("Mail saved")
        case MFMailComposeResult.sent:
            print("Mail sent")
        case MFMailComposeResult.failed:
            print("Mail sent failure: \(String(describing: error?.localizedDescription))")
        default:
            break
        }
        self.dismiss(animated: true)
        
    }
}
