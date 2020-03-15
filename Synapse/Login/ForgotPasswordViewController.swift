//
//  ForgotPasswordViewController.swift
//  Synapse
//
//  Created by Allison Trager on 3/15/20.
//  Copyright © 2020 Synapse. All rights reserved.
//

import UIKit
import FirebaseAuth
import Firebase

class ForgotPasswordViewController: UIViewController {
    
    @IBOutlet weak var emailTextField: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    @IBAction func resetDidTapped(_ sender: Any) {
        let cleanedEmail = emailTextField.text!.trimmingCharacters(in: .whitespacesAndNewlines)
        Auth.auth().sendPasswordReset(withEmail: cleanedEmail) { error in
            if error != nil{
                let resetFailedAlert = UIAlertController(title: "Reset Failed", message: "Error: \(String(describing: error?.localizedDescription))", preferredStyle: .alert)
                resetFailedAlert.addAction(UIAlertAction(title: "OK", style: .default, handler: nil))
                self.present(resetFailedAlert, animated: true, completion: nil)
            }else {
                let resetEmailSentAlert = UIAlertController(title: "Reset email sent successfully", message: "Check your email", preferredStyle: .alert)
                resetEmailSentAlert.addAction(UIAlertAction(title: "OK", style: .default, handler: nil))
                self.present(resetEmailSentAlert, animated: true, completion: nil)
            }
        }
    }
    
}
