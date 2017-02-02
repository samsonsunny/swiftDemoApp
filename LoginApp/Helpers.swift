//
//  Helpers.swift
//  LoginApp
//
//  Created by Sam on 02/02/17.
//  Copyright © 2017 Sam. All rights reserved.
//

import Foundation

class Helpers: NSObject {
	
	static func isValid(email:String) -> Bool {
		
		let emailRegex = "[A-Z0-9a-z._%+-]+@[A-Za-z0-9.-]+\\.[A-Za-z]{2,6}"
		
		return NSPredicate(format: "SELF MATCHES %@", emailRegex).evaluate(with: email)
		
	}
	
	static func validate(email: String, password: String, name: String) -> (success: Bool,text: String) {
		
		if email.isEmpty || password.isEmpty || name.isEmpty {
			
			return (false,"Please provide data in all the fields.")
			
		}
		
		if !self.isValid(email: email) {
			
			return (false,"Please provide valid email id.")
			
		}
		return (true,"Success")
	}
	
	static func validate(email: String, password: String) -> (success: Bool,text: String) {
		
		if email.isEmpty || password.isEmpty {
			
			return (false,"Please provide data in all the fields.")
			
		}
		if !self.isValid(email: email) {
			
			return (false,"Please provide valid email id.")
			
		}
		return (true,"Success")
	}
}
