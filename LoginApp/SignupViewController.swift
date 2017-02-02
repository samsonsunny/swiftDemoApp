//
//  SignupViewController.swift
//  LoginApp
//
//  Created by Sam on 25/01/17.
//  Copyright © 2017 Sam. All rights reserved.
//

import UIKit
import Foundation
import CoreData
import MagicalRecord


class SignupViewController: UIViewController {
	
	@IBOutlet weak var userNameField: UITextField!
	
	@IBOutlet weak var passwordField: UITextField!
	
	@IBOutlet weak var emailIdField: UITextField!
	
	let defaults = UserDefaults.standard
	
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
	
	func validate(email: String, password: String, name: String) -> (success: Bool,text: String) {
		
		if email.isEmpty || password.isEmpty || name.isEmpty {
			
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
	
	@IBAction func registerUser() {
		
		if let email = emailIdField.text, let password = passwordField.text, let userName = userNameField.text {
			
			let response = validate(email: email, password: password, name: userName)
			
			if !response.success {
				
				showAlert(message: response.text)
				return
			}
			
			if UserInfo.mr_findFirst(byAttribute: "emailId", withValue: email) != nil
			{
				showAlert(message: "Already have an account")
				return
			}
			
			let context	= NSManagedObjectContext.mr_default()
			
			let user = UserInfo.mr_create(in: context) as? UserInfo
			
			user?.emailId = email
			
			user?.password = password
			
			user?.userName = userName
			
			context?.mr_saveToPersistentStore(completion: nil)
			
			defaults.set(userName, forKey: "loggedInUser")
			
			defaults.set(email, forKey: "loggedInUserEmail")
			
			defaults.set(true, forKey: "isLoggedIn")
			
			defaults.synchronize()
			
			if let nextViewController = self.storyboard?.instantiateViewController(withIdentifier: "MainTabBarControllerID") as? MainTabBarController {
				
				self.navigationController?.pushViewController(nextViewController, animated: true)
			}
		}
	}
	
	@IBAction func pushToLogin(_ sender: Any) {
		
		_ = self.navigationController?.popViewController(animated: true)
	}
	
}
