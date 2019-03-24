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

    @IBOutlet weak var NameField: UITextField!
    @IBOutlet weak var EmailField: UITextField!
    @IBOutlet weak var Message: UITextView!
    
    @IBOutlet weak var btn: UIButton!
    
    

    
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
   
    @IBAction func sendemail(_ sender: Any) {
        
        let mc : MFMailComposeViewController = MFMailComposeViewController()
        
        mc.mailComposeDelegate = self
        
        let recipients = ["abc@123.com"]
        
        mc.setToRecipients(recipients)
        mc.setSubject(NameField.text! + " - my app")
        mc.setMessageBody("""
            Name: \(NameField.text!)
            Email: \(EmailField.text!)
            Message: \(Message.text!)
            """, isHTML: false)
        
        self.present(mc, animated: true, completion: nil)
    }
    
   
    
    func mailComposeController(_ controller: MFMailComposeViewController, didFinishWith result: MFMailComposeResult, error: Error?) {
        
        self.dismiss(animated: true, completion: nil)
        
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
