//
//  ViewController.swift
//  SimpleApp
//
//  Created by Kuanyshbay Ibragim on 06.01.2021.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var loginField: UITextField!
    @IBOutlet weak var passwordField: UITextField!
    @IBOutlet weak var signInButton: UIButton!
    @IBOutlet weak var errorLabel: UILabel!
    override func viewDidLoad() {
        super.viewDidLoad()
        self.errorLabel.isHidden = true
    }
    var validation = Validation()

    @IBAction func signIn(_ sender: Any) {

        guard let login = loginField.text, let password = passwordField.text else {
        return
        }

        let isValidateLogin = self.validation.validateLogin(name: login)
        if (!isValidateLogin){
            print("Your login must have 3 characters at least and 18 at maximum!")
            self.errorLabel.isHidden = false
            return
        }

        let isValidatePassword = self.validation.validatePassword(password: password)
        if (!isValidatePassword){
            print("Your password must have 8 characters and 1 alphabet and 1 number at least!")
            self.errorLabel.isHidden = false
            return
        }

        self.errorLabel.isHidden = true
        let vc = storyboard?.instantiateViewController(identifier: "ThirdVC") as! ThirdVC
        navigationController?.pushViewController(vc, animated: true)
    }

}

