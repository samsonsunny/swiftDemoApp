//
//  LoginViewController.swift
//  LoginApp
//
//  Created by Sam on 25/01/17.
//  Copyright © 2017 Sam. All rights reserved.
//

import UIKit
import CoreData
import MagicalRecord

class LoginViewController: UIViewController {
	
	
	@IBOutlet weak var emailField: UITextField!

	@IBOutlet weak var passwordField: UITextField!
	
	let defaults = UserDefaults.standard
	
	override func viewDidLoad() {

		super.viewDidLoad()

	}
	
	override func viewWillAppear(_ animated: Bool) {
		
		super.viewWillAppear(true)
		
	}
	
	override func didReceiveMemoryWarning() {
		super.didReceiveMemoryWarning()
	}
	
	func validate(email: String, password: String) -> (success: Bool,text: String) {
		
		if email.isEmpty || password.isEmpty {
			
			return (false,"Please provide data in all the fields.")
			
		}
		if !isValid(email: email) {
			
			return (false,"Please provide valid email id.")
			
		}
		return (true,"Success")
	}
	
	func isValid(email:String) -> Bool {
		
		let emailRegex = "[A-Z0-9a-z._%+-]+@[A-Za-z0-9.-]+\\.[A-Za-z]{2,6}"
		
		return NSPredicate(format: "SELF MATCHES %@", emailRegex).evaluate(with: email)
		
	}

	func showAlert(message: String) {
		
		let alertController = UIAlertController(title: "", message: message, preferredStyle: .alert)
		
		let OKAction = UIAlertAction(title: "OK", style: .default, handler: nil)
		alertController.addAction(OKAction)
		
		self.present(alertController, animated: true, completion: nil)
		
	}
	
	@IBAction func checkLoginCredentials() {
		
		if let email = emailField.text, let password = passwordField.text {
			
			let response = validate(email: email, password: password)
		
			if !response.success {
				
				showAlert(message: response.text)
				return
			}
	
			if let user: UserInfo = UserInfo.mr_findFirst(byAttribute: "emailId", withValue: email) as? UserInfo
			{
				
				guard let storedPassword = user.password, password == storedPassword else {
					
					showAlert(message: "Please check your password")
					
					return
				}
				defaults.set(user.userName, forKey: "loggedInUser")
				
				defaults.set(user.emailId, forKey: "loggedInUserEmail")
				
				defaults.set(true, forKey: "isLoggedIn")
				
				defaults.synchronize()
				
				if let nextViewController = self.storyboard?.instantiateViewController(withIdentifier: "MainTabBarControllerID") as? MainTabBarController {
					
					self.navigationController?.pushViewController(nextViewController, animated: true)
				}else{
					
					showAlert(message: "Please try again later")
				}
			}else{
				
				showAlert(message: "Login doesn't exist")
			}
		}
	}
}
