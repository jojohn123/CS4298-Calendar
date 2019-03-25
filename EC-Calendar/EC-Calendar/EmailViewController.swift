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

    
    @IBOutlet weak var btn: UIButton!

    @IBOutlet weak var name: UITextField!
    @IBOutlet weak var emailAddress: UITextField!
    @IBOutlet weak var textInput: UITextView!
    
    @IBAction func dismissKeyboard(_ sender: Any) {
        
        self.resignFirstResponder()
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.navigationItem.title = "Email Us"
        // Do any additional setup after loading the view.
    }
    
    func textView(_ textView: UITextView, shouldChangeTextIn range: NSRange, replacementText text: String) -> Bool {
        
        if text == "\n" {
            
            textView.resignFirstResponder()
            return false
            
        }
        
        return true
        
    }
   

    
    @IBAction func sendEmail(_ sender: UIButton) {
        if MFMailComposeViewController.canSendMail() {
            let mc = MFMailComposeViewController()
            mc.mailComposeDelegate = self
            let recipients = ["abc@123.com"]
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
    
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
