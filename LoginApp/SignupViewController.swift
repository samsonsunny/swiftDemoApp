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
	
	@IBAction func registerUser() {
		
		if let email = emailIdField.text, let password = passwordField.text, let userName = userNameField.text {
			
			let response = Helpers.validate(email: email, password: password, name: userName)
			
			if !response.success {
				
				alert.showAlert(message: response.text, on: self)
				
				return
			}
			
			if UserInfo.mr_findFirst(byAttribute: "emailId", withValue: email) != nil
			{
				
				alert.showAlert(message: "Already have an account", on: self)
				
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
