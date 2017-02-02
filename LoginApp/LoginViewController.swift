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
	
	let alert = AlertUtil()
	
	override func viewDidLoad() {

		super.viewDidLoad()
		
		self.navigationItem.setHidesBackButton(true, animated: true)
	}
	
	override func viewWillAppear(_ animated: Bool) {
		
		super.viewWillAppear(true)
		
	}
	
	override func didReceiveMemoryWarning() {
		super.didReceiveMemoryWarning()
	}
	
	@IBAction func checkLoginCredentials() {
		
		if let email = emailField.text, let password = passwordField.text {
			
			let response = Helpers.validate(email: email, password: password)
		
			if !response.success {
				
				alert.showAlert(message: response.text, on: self)
				
				return
			}
	
			if let user: UserInfo = UserInfo.mr_findFirst(byAttribute: "emailId", withValue: email) as? UserInfo
			{
				
				guard let storedPassword = user.password, password == storedPassword else {
					
					alert.showAlert(message: "Please check your password", on: self)
					
					return
				}
				defaults.set(user.userName, forKey: "loggedInUser")
				
				defaults.set(user.emailId, forKey: "loggedInUserEmail")
				
				defaults.set(true, forKey: "isLoggedIn")
				
				defaults.synchronize()
				
				if let nextViewController = self.storyboard?.instantiateViewController(withIdentifier: "MainTabBarControllerID") as? MainTabBarController {
					
					self.navigationController?.pushViewController(nextViewController, animated: true)
				}else{
					
					alert.showAlert(message: "Please try again later", on: self)
				}
			}else{
				
				alert.showAlert(message: "Login doesn't exist", on: self)
			}
		}
	}
	
	@IBAction func pushToSignUp(_ sender: Any) {
		
		if let nextViewController = self.storyboard?.instantiateViewController(withIdentifier: "SignupViewControllerID") as? SignupViewController {
			
			self.navigationController?.pushViewController(nextViewController, animated: true)
		}
	}
	
}
