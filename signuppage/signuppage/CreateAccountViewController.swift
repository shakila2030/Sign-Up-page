//
//  CreateAccountViewController.swift
//  signuppage
//
//  Created by Shakila kularathne on 6/5/2566 BE.
//  Copyright © 2566 BE Shakila kularathne. All rights reserved.
//

import UIKit

class CreateAccountViewController: UIViewController {

    @IBOutlet weak var emailTextField: UITextField!
    @IBOutlet weak var passwordTextField: UITextField!
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    
    @IBAction func signupClicked(_ sender: UIButton) {
        
        guard let email = emailTextField.text, !email.isEmpty,
              let password = passwordTextField.text, !password.isEmpty else {
            // Display an alert or appropriate error message
            return
        }
        
     
        
        
        if !validateEmail(email) {
                   // Display an alert or highlight the email field with an error message
                   return
               }
               
               if !validatePassword(password) {
                   // Display an alert or highlight the password field with an error message
                   return
               }
               
               // Proceed with signup process if all validations pass
               AuthService.signup( email: email, password: password) { result in
                   // Handle signup result
               }
    }
    func validateEmail(_ email: String) -> Bool {
            let emailRegex = "[A-Z0-9a-z._%+-]+@[A-Za-z0-9.-]+\\.[A-Za-z]{2,}"
            let emailPredicate = NSPredicate(format: "SELF MATCHES %@", emailRegex)
            return emailPredicate.evaluate(with: email)
        }
        
        func validatePassword(_ password: String) -> Bool {
            let passwordRegex = "^(?=.*[a-z])(?=.*[A-Z])(?=.*\\d)(?=.*[@$!%*?&])[A-Za-z\\d@$!%*?&]{8,}$"
            let passwordPredicate = NSPredicate(format: "SELF MATCHES %@", passwordRegex)
            return passwordPredicate.evaluate(with: password)
        }
    }

    class AuthService {
        static func signup( email: String, password: String, completion: @escaping (Result<User, Error>) -> Void) {
            // Perform signup logic, such as calling API endpoints or interacting with authentication systems
            // Handle the signup result and invoke the completion block with appropriate success or failure
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
struct User {
    // Define your user model properties
}
