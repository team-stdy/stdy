//
//  LoginViewController.swift
//  Synapse
//
//  Created by Allison Trager on 2/13/20.
//  Copyright © 2020 Synapse. All rights reserved.
//

import UIKit
import FirebaseAuth
import FirebaseFirestore

class LoginViewController: UIViewController {

    
    @IBOutlet weak var emailTextField: UITextField!
    @IBOutlet weak var passwordTextField: UITextField!
    @IBOutlet weak var errorLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setUpElements()
    }
    
    func setUpElements(){
        view.addVerticalGradientLayer(topColor: primaryColor!, bottomColor: secondaryColor!)
    }
    
    @IBAction func loginButtonTapped(_ sender: Any) {
           //Validate fields
           let error = validateFields()
           
           if error != nil {
               showError(error!)
           }
               
           else {
           // Create cleaned versions of the text field
           let email = emailTextField.text!.trimmingCharacters(in: .whitespacesAndNewlines)
           let password = passwordTextField.text!.trimmingCharacters(in: .whitespacesAndNewlines)
           
           // Signing in the user
           Auth.auth().signIn(withEmail: email, password: password) { (result, error) in
               
               if error != nil {
                   // Couldn't sign in
                   self.showError(error!.localizedDescription)
               }
               else {
                
                //handle success
//                guard let mainTabVC = UIApplication.shared.currentWindow?.rootViewController as? HomeViewController else {return}
                
                //configure view controllers in main tab
//                mainTabVC.configureViewControllers()
//
                //dismiss login controller
                
//                HomeViewController()
                self.dismiss(animated: true, completion: nil)
                                   self.transitionToHome()
                
               }
           }
        }
    }
    
    func transitionToHome() {
        let vcHome = storyboard?.instantiateViewController(identifier: "HomeViewController") as? HomeViewController
        
        view.window?.rootViewController = vcHome
        view.window?.makeKeyAndVisible()
        
    }
    
    //check the fields and validate that the data is correct. If everything i s correct, this methods reutnrs nil. Otherwise, it returns error message
    func validateFields() -> String? {
        
        //Check if fields are empty
        if emailTextField.text?.trimmingCharacters(in: .whitespacesAndNewlines) == "" ||
            passwordTextField.text?.trimmingCharacters(in: .whitespacesAndNewlines) == ""
        {
            return "Please fill in all fields"
        }
        
        //Check if email is secure
        let cleanedEmail = emailTextField.text!.trimmingCharacters(in: .whitespacesAndNewlines)
        
        if Utilities.isValidEmail(cleanedEmail) == false {
            //Password is not secure enough
            return "Please make sure you enter a valid email."
        }
        
        //Check if password is secure
        let cleanedPassword = passwordTextField.text!.trimmingCharacters(in: .whitespacesAndNewlines)
        
        if Utilities.isPasswordValid(cleanedPassword) == false {
            //Password is not secure enough
            return "Please make sure your password is at least 8 characters, contains a special character, and a number."
        }
        
        return nil
    }
    
    func showError(_ message: String) {
        //There was an error so we need to show the error message
        errorLabel.text = message
        errorLabel.alpha = 1;
        
    }
}


extension UIApplication {
    var currentWindow: UIWindow? {
        connectedScenes
        .filter({$0.activationState == .foregroundActive})
        .map({$0 as? UIWindowScene})
        .compactMap({$0})
        .first?.windows
        .filter({$0.isKeyWindow}).first
    }
}
