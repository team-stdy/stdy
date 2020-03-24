//
//  ProfileViewController.swift
//  Synapse
//
//  Created by Neil Dan on 2/5/20.
//  Copyright © 2020 Synapse. All rights reserved.
//

import UIKit
import FirebaseAuth
import FirebaseFirestore
import FirebaseDatabase
import Firebase

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
        setUpProfile()
        setUpImage()
        
        
    }
    
    func setUpProfile(){
        
        let currentUid = Auth.auth().currentUser?.uid
        
        Database.database().reference().child("users").child(currentUid!).observeSingleEvent(of: .value) {
            (snapshot) in
            guard let dictionary = snapshot.value as? Dictionary<String, AnyObject> else {return}
            let uid = snapshot.key
            let user = User(uid: uid, dictionary: dictionary)
            self.firstNameLabel.text = user.firstName
            self.lastNameLabel.text = user.lastName
            self.universityLabel.text = user.university
            guard let profileImageUrl = user.profileImageUrl else { return }
            self.profileImage.loadImage(with: profileImageUrl)
        }
        
//        let docRef = Firestore.firestore().collection("users").whereField("uid", isEqualTo: Auth.auth().currentUser?.uid ?? "")
        
//        // Get data
//        docRef.getDocuments { (querySnapshot, err) in
//            if let err = err {
//                print(err.localizedDescription)
//                return
//            }
//            else if querySnapshot!.documents.count != 1 {
//                print("More than one documents or none")
//            } else {
//                let document = querySnapshot!.documents.first
//                //dictionary
//                let dataDescription = document?.data()
//                guard let uid = dataDescription?["uid"] else { return }
//                guard let firstname = dataDescription?["firstName"] else { return }
//                guard let lastname = dataDescription?["lastName"] else { return }
//                guard let university = dataDescription?["university"] else { return }
//
//                self.firstNameLabel.text = firstname as? String
//                self.lastNameLabel.text = lastname as? String
//                self.universityLabel.text = university as? String
//            }
//        }
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
        let firebaseAuth = Auth.auth()
        do {
            try firebaseAuth.signOut()
            let storyboard = UIStoryboard(name: "Main", bundle: nil)
            let login = storyboard.instantiateViewController(withIdentifier: "LoginViewController") as! LoginViewController
            self.present(login, animated: false)
        } catch let signOutError as NSError {
            print ("Error signing out: %@", signOutError)
        }
        
    }
    
}


