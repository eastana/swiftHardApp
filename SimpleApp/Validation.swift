//
//  Validation.swift
//  SimpleApp
//
//  Created by Kuanyshbay Ibragim on 07.01.2021.
//

import Foundation

class Validation {
    public func validateLogin(name: String) ->Bool {
          // Length be 18 characters max and 3 characters minimum, you can always modify.
          let nameRegex = "^\\w{3,18}$"
          let trimmedString = name.trimmingCharacters(in: .whitespaces)
          let validateLogin = NSPredicate(format: "SELF MATCHES %@", nameRegex)
          let isValidateLogin = validateLogin.evaluate(with: trimmedString)
          return isValidateLogin
       }
    
    public func validatePassword(password: String) -> Bool {
          //Minimum 8 characters at least 1 Alphabet and 1 Number:
          let passRegEx = "^(?=.*[A-Za-z])(?=.*\\d)[A-Za-z\\d]{8,}$"
          let trimmedString = password.trimmingCharacters(in: .whitespaces)
          let validatePassord = NSPredicate(format:"SELF MATCHES %@", passRegEx)
          let isvalidatePass = validatePassord.evaluate(with: trimmedString)
          return isvalidatePass
       }
}
