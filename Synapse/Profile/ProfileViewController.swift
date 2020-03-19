//
//  ProfileViewController.swift
//  Synapse
//
//  Created by Neil Dan on 2/5/20.
//  Copyright © 2020 Synapse. All rights reserved.
//

import UIKit
import FirebaseAuth
import Firebase
import FirebaseDatabase

class ProfileViewController: UIViewController {
    
    @IBOutlet weak var profileImage: UIImageView!
    
    @IBOutlet weak var firstNameLabel: UILabel!
    @IBOutlet weak var lastNameLabel: UILabel!
    @IBOutlet weak var emailLabel: UILabel!
    @IBOutlet weak var universityLabel: UILabel!
    
   // let storage =  Storage.storage()

    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.addVerticalGradientLayer(topColor: primaryColor!, bottomColor: secondaryColor!)
        
//        checkIfUserIsLoggedIn()
//        setUpProfile()
        setUpImage()
        
        
    }
    
//    func checkIfUserIsLoggedIn(){
//        if Auth.auth().currentUser?.uid == nil {
//            perform(#selector(handleLogout), with: nil, afterDelay: 0)
//        } else {
//            let uid = Auth.auth().currentUser?.uid
//            Database.database().reference().child("users").child(uid!).observeSingleEvent(of: .value, with: { (snapshot) in
//                print(snapshot)
//                if let dictionary = snapshot.value as? [String: AnyObject]{
//                    self.firstNameLabel.text! = "First Name: "
//                    self.firstNameLabel.text! += (dictionary["firstName"] as? String)!
//
//                    self.lastNameLabel.text! = "Last Name: "
//                    self.lastNameLabel.text! += (dictionary["lastName"] as? String)!
//
//                    self.lastNameLabel.text! = "University: "
//                    self.universityLabel.text! += (dictionary["university"] as? String)!
//                }
//            }, withCancel: nil)
//        }
//    }
    
    func setUpProfile(){
//        let uid = Auth.auth().currentUser?.uid
//        db.child("users").child(uid!).observeSingleEvent(of: .value, with: { (snapshot)
//            in
//            if let dict = snapshot.value as? (AnyObject) {
//                self.firstNameLabel.text = dict["firstName" as NSString] as? [String : Any]
//                self.lastNameLabel.text = dict["lastName" as NSString] as? [String : Any]
//                self.emailLabel.text = dict["email" as NSString] as? [String : Any]
//                self.universityLabel.text = dict["university" as NSString] as? [String : Any]
//            }
//        })
    }
    
    func setUpImage(){
        profileImage.layer.masksToBounds = true
        profileImage.layer.cornerRadius = profileImage.bounds.width / 2
        profileImage.layer.borderColor = UIColor.black.cgColor
        profileImage.layer.borderWidth = 1
        
    }
    
    
    //started this but it needs to transition to the login page after a user signs out so please update this method
    @IBAction func logOutTapped(_ sender: Any) {
        handleLogout()
    }
    
    //started this but it needs to transition to the login page after a user signs out so please update this method
    @objc func handleLogout() {
//                let firebaseAuth = Auth.auth()
//        do {
//            try firebaseAuth.signOut()
//            let storyboard = UIStoryboard(name: "Main", bundle: nil)
//            let login = storyboard.instantiateViewController(withIdentifier: "LoginViewController") as! LoginViewController
//            self.present(login, animated: false)
//        } catch let signOutError as NSError {
//            print ("Error signing out: %@", signOutError)
//        }
        
        //declare alert controller
        let alertController = UIAlertController(title: nil, message: nil, preferredStyle: .actionSheet)
        
        //add alert action
        alertController.addAction(UIAlertAction(title: "Log Out", style: .destructive, handler: { (UIAlertAction) in
            do {
                //attempt to sign out
                try Auth.auth().signOut()
//                let loginVC = LoginViewController()
                            let storyboard = UIStoryboard(name: "Main", bundle: nil)
            let login = storyboard.instantiateViewController(withIdentifier: "LoginViewController") as! LoginViewController
            self.present(login, animated: false)
                
            } catch {
                //handle error
                print("Failed Sign Out")
            }
        }))
        
        alertController.addAction(UIAlertAction(title: "Cancel", style: .cancel, handler: nil))
        
        present(alertController, animated: true, completion: nil)
        
    }
    
}


