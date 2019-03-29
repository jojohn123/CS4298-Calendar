//
//  SettingViewController.swift
//  EC-Calendar
//
//  Created by Trevor Wong on 29/3/2019.
//  Copyright © 2019 Group8. All rights reserved.
//

import UIKit

class SettingViewController: UIViewController, UINavigationControllerDelegate, UIImagePickerControllerDelegate, UIGestureRecognizerDelegate {

    @IBOutlet weak var profilePic: UIImageView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
//        var UITapRecogniser = UITapGestureRecognizer(target: self, action: "tappedImage:")
//        UITapRecogniser.delegate = self
//        self.profilePic.addGestureRecognizer(UITapRecogniser)
//        self.profilePic.isUserInteractionEnabled = true
        // Do any additional setup after loading the view.
    }
    
    @IBAction func pickProfilePic(_ sender: Any) {
        let image = UIImagePickerController()
        image.delegate = self
        image.sourceType = UIImagePickerController.SourceType.photoLibrary
        image.allowsEditing = false
        self.present(image, animated: true) {
            
        }
    }
    
    func chooseProfilePic() {
        let image = UIImagePickerController()
        image.delegate = self
        image.sourceType = UIImagePickerController.SourceType.photoLibrary
        image.allowsEditing = false
        self.present(image, animated: true) {
            
        }
    }
    
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey : Any]) {
        if let image = info[UIImagePickerController.InfoKey.originalImage] as? UIImage {
            profilePic.image = image
        }
        self.dismiss(animated: true, completion: nil)
    }
    
    func tappedImage(sender: AnyObject) {
        print("hello")
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
