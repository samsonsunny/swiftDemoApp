//
//  ForgotPasswordViewController.swift
//  LoginApp
//
//  Created by Sam on 25/01/17.
//  Copyright © 2017 Sam. All rights reserved.
//

import UIKit

import MagicalRecord

class ChangePasswordViewController: UIViewController {
	
	@IBOutlet weak var oldPasswordField: UITextField!
	
	@IBOutlet weak var newPasswordField: UITextField!
	
	
	let defaults = UserDefaults.standard

	let alert = AlertUtil()
	
	override func viewDidLoad() {
		
		super.viewDidLoad()
		
		self.navigationItem.title = "Change Password"

	}
	
	override func didReceiveMemoryWarning() {
		
		super.didReceiveMemoryWarning()
	}
	
	@IBAction func updatePassword() {
		
		guard let oldPassword = oldPasswordField.text, let newPassword = newPasswordField.text else {
			
			alert.showAlert(message: "Please provide value in both the fields", on: self)
			
			return
		}
		
		let context	= NSManagedObjectContext.mr_default()
		
		guard let emailId = defaults.object(forKey: "loggedInUserEmail") as? String, let user: UserInfo = UserInfo.mr_findFirst(byAttribute: "emailId", withValue: emailId) as? UserInfo else {
			
			alert.showAlert(message: "User data is not available in DB", on: self)
			
			return
		}
		
		guard let password = user.password, password == oldPassword else {
			
			alert.showAlert(message: "Please provide old password", on: self)
			
			return
		}
		
		user.password = newPassword
		
		context?.mr_saveToPersistentStore(completion: { (response, error) in
			
			if response {
				
				self.alert.showAlert(message: "Password Updated", on: self)
				
				return
			}
			
			self.alert.showAlert(message: "Oops! password not able to change", on: self)
		})
	}
}
