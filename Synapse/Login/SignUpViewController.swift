//
//  SignUpViewController.swift
//  Synapse
//
//  Created by Allison Trager on 2/12/20.
//  Copyright © 2020 Synapse. All rights reserved.
//

import UIKit
import FirebaseAuth
import FirebaseFirestore
import FirebaseStorage
import Firebase

class SignUpViewController: UIViewController {
    
    
    @IBOutlet weak var universityButton: UIButton!
    
    @IBOutlet weak var universityTable: UITableView!
    
    @IBOutlet weak var profileImage: UIImageView!
    @IBOutlet weak var firstNameTextField: UITextField!
    @IBOutlet weak var lastNameTextField: UITextField!
    @IBOutlet weak var emailTextField: UITextField!
    @IBOutlet weak var passwordTextField: UITextField!
    @IBOutlet weak var signUpButton: UIButton!
    @IBOutlet weak var errorLabel: UILabel!
    
    var selectedImage: UIImage?
    
    var universities = ["Massachusetts Institue of Technology", "Stanford University", "Harvard University", "California Institute of Technology", "University of Chicago", "Princeton University", "Cornell University", "University of Pennsylvania", "Yale University", "Columbia University", "University of Michigan", "Johns Hopkins University", "University of California, Berkely", "Northwestern University", "New York University", "University of California, San Diego", "Carnegie Mellon University", "University of Wisconsin-Madison", "Brown University", "University of Texas at Austin", "University of Washington", "Georgia Institue of Technology", "Univeristy of Illinois at Urbana-Champaign", "Rice University", "University of North Carolina, Chapel Hill", "Pennsylvania State University", "Boston University", "The Ohio State University", "University of California, Davis", "Washington University in St. Louis", "Purdue University", "University of Southern California", "University of California, Santa Barabara", "University of Maryland, College Park", "University of Pittsburgh", "Michigan State Univeristy", "Emory University", "University of Minnesota", "University of Florida", "University of Rochester", "Case Western Reserve University", "Texas A&M University", "University of Virginia", "Vanderbilt University", "University of Colorado Boulder", "Dartmouth College", "University of Notre Dame", "Arizona State University", "University of California, Irvine", "Georgetown University", "University of Illinois, Chicago", "Tufts University", "Rutgers University - New Brunswick", "University of Arizona", "University of Miami", "North Carolina State University", "Indiana University Bloomington", "University of Hawai'i at Manoa", "Virgnia Polytechnic Intitute and State University", "George Washington University", "University of Buffalo SUNY", "Northeastern University", "University of Utah", "Stony Brook University, State University of New York", "The Katz School at Yeshiva University", "University of California, Santa Cruz", "Univeristy of Connecticut", "Rensselaer Polytechnic University", "University of Colorado, Denver", "Wake Forest University", "Washington State University", "The University of Tennesse, Knoxville", "Tulane University", "Illinois Institute of Technology", "University of Iowa", "Boston College", "Colorado State University", "Florida State University", "University of California, Riverside", "University of Maryland", "Baltimore County", "Oregon State University", "Brandeis University", "The University of Georgia", "Wayne State University", "University of Delaware", "University of Texas Dallas", "Iowa State University", "Clark University", "Lehigh University", "University of Missouri, Columbia", "Drexel University", "The New School", "University of Cincinnati", "University of South Carolina at Columbia", "University of Massachusetts, Boston", "University of Oklahoma", "University of Vermont", "Southern Methodist University", "Duke University", "University of California, Los Angeles","College of William and Mary", "Northeastern University", "Villanova University", "Pepperdine University", "Santa Clara University", "Syracuse University", "Loyola Marymount University", "University of Massachusetts-Amherst", "Clemson University", "Auburn University", "University of Massachusetts-Amherst", "Fordham University", "Stevens Institute of Technology", "American Univeristy", "Brigham Young Univeristy", "Baylor University", "Gonzaga University", "Colorado School of Mines", "Elon University", "Marquette Univresity", "New Jersey Institute of Technology", "Saint Louis University", "Texas Christian University", "Howard University", "Creighton University"].sorted()
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setUpElements()
    }
    
    func setUpElements () {
        view.addVerticalGradientLayer(topColor: primaryColor!, bottomColor: secondaryColor!)
        universityTable.isHidden = true
        errorLabel.alpha = 0
//        profileImage.layer.masksToBounds = false

        let tapGesture = UITapGestureRecognizer(target: self, action: #selector(SignUpViewController.handleSelectProfileImageView))
        profileImage.addGestureRecognizer(tapGesture)
        profileImage.isUserInteractionEnabled = true
        profileImage.clipsToBounds = true
        profileImage.layer.cornerRadius = profileImage.frame.size.height/2
    }
    
    @objc func handleSelectProfileImageView(){
        let pickerController = UIImagePickerController()
        pickerController.delegate = self
        pickerController.allowsEditing = true
        pickerController.sourceType = .photoLibrary
        present(pickerController, animated: true, completion: nil)
    }
    
    @IBAction func onClickUniversityButton(_ sender: Any) {
        if universityTable.isHidden {
            animate(toggle: true)
        } else {
            animate(toggle: false)
        }
    }
    
    func animate(toggle: Bool){
        if toggle {
            UIView.animate(withDuration: 0.3){
                self.universityTable.isHidden = false
            }
        } else {
            UIView.animate(withDuration: 0.3){
                self.universityTable.isHidden = true
            }
        }
    }
    
    @IBAction func signUpTapped(_ sender: Any) {
        
        //Validate fields
        let error = validateFields()
        
        if error != nil {
            showError(error!)
        }
            
        else {
            //Create cleaned versions of data
            let firstName = firstNameTextField.text!.trimmingCharacters(in: .whitespacesAndNewlines)
            let lastName = lastNameTextField.text!.trimmingCharacters(in: .whitespacesAndNewlines)
            let email = emailTextField.text!.trimmingCharacters(in: .whitespacesAndNewlines)
            let password = passwordTextField.text!.trimmingCharacters(in: .whitespacesAndNewlines)
            let university = universityButton.titleLabel!.text!.trimmingCharacters(in: .whitespacesAndNewlines)

            //Create user
            Auth.auth().createUser(withEmail: email, password: password) { (result, err) in
                
                // handle error
                if let error = error {
                    print("DEBUG: Failed to create user with error: ", error)
                    return
                }
                
                guard let profileImg = self.selectedImage else { return }
                guard let uploadData = profileImg.jpegData(compressionQuality: 0.3) else { return }
                
                let filename = NSUUID().uuidString
                
                // UPDATE: - In order to get download URL must add filename to storage ref like this
                let storageRef = Storage.storage().reference().child("profile_images").child(filename)
                
                storageRef.putData(uploadData, metadata: nil, completion: { (metadata, error) in
                    
                    // handle error
                    if let error = error {
                        print("Failed to upload image to Firebase Storage with error", error.localizedDescription)
                        return
                    }
                    
                    // UPDATE: - Firebase 5 must now retrieve download url
                    storageRef.downloadURL(completion: { (downloadURL, error) in
                        guard let profileImageUrl = downloadURL?.absoluteString else {
                            print("DEBUG: Profile image url is nil")
                            return
                        }
                        
                        // user id
                        guard let uid = result?.user.uid else { return }
                        
                        let dictionaryValues = ["firstName": firstName,
                                                "lastName": lastName,
                            "email": email,
                            "university": university,
                            "profileImageUrl": profileImageUrl]
                        
                        let values = [uid: dictionaryValues]
                        
                        // save user info to database
                        Database.database().reference().child("users").updateChildValues(values, withCompletionBlock: { (error, ref) in
                            self.transitionToHome()
                        })
                    })
                })
                
                
                //Check for errors
//                if err != nil {
//                    self.showError("Error creating user.")
//                } else {
//                    let storageRef = Storage.storage().reference(forURL: "gs://synapse-bbfb2.appspot.com").child("profile_image").child(result!.user.uid)
//                    if let profileImg = self.selectedImage, let imageData = profileImg.jpegData(compressionQuality: 0.1) {
//                        storageRef.putData(imageData, metadata: nil) { (metadata, error) in
//                            if error != nil {
//                                self.showError("Error saving photo")
//                                return
//                            }
//
//                            storageRef.downloadURL { (url, error) in
//                                if error != nil {
//                                    print(error!)
//                                    return
//                                }
//                                if url != nil {
//                                    let db = Firestore.firestore()
//                                    let profileImageUrl = url!.absoluteString
//                                    db.collection("users").addDocument(data:
//                                    ["firstName": firstName, "lastName": lastName, "university": university, "profileImage": profileImageUrl, "uid": result!.user.uid]) { (error) in
//                                        if error != nil {
//                                            self.showError("Error saving user data")
//                                        }
//                                    }
//                                }
//                            }
//                        }
//                    }
//                }
            }

            //Transition to home screen
//            self.transitionToHome()
        }
    }
    
    func transitionToHome() {
        let vcHome = storyboard?.instantiateViewController(identifier: "HomeViewController") as? HomeViewController
        
        view.window?.rootViewController = vcHome
        view.window?.makeKeyAndVisible()
        
    }
    
    func showError(_ message: String) {
        //There was an error so we need to show the error message
        errorLabel.text = message
        errorLabel.alpha = 1;
        
    }
    //checl the fields and validate that the data is correct. If everything i s correct, this methods reutnrs nil. Otherwise, it returns error message
    func validateFields() -> String? {
        
        //Check if fields are empty
        if firstNameTextField.text?.trimmingCharacters(in: .whitespacesAndNewlines) == "" ||
            lastNameTextField.text?.trimmingCharacters(in: .whitespacesAndNewlines) == "" ||
            emailTextField.text?.trimmingCharacters(in: .whitespacesAndNewlines) == "" ||
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
        
        //this is not working not sure why
        if (universityButton.titleLabel!.text!.isEqual("Click to Select University")) {
            return "Please select a university."
        }
        
        return nil
    }
    
}

extension SignUpViewController: UITableViewDelegate, UITableViewDataSource, UIImagePickerControllerDelegate, UINavigationControllerDelegate {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return universities.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "UniversityCell", for: indexPath)
        cell.textLabel?.text = universities[indexPath.row]
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        universityButton.setTitle("\(universities[indexPath.row])", for: .normal)
        animate(toggle: false)
    }
    
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey : Any]) {
        if let pickedImage = info[.originalImage] as? UIImage{
            selectedImage = pickedImage
            profileImage.image = pickedImage
            
        }
        dismiss(animated: true, completion: nil)
    }
    
    
    
}

