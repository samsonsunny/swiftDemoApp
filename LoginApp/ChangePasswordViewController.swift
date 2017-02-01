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

	override func viewDidLoad() {
		
		super.viewDidLoad()
		
		self.navigationItem.title = "Change Password"

	}
	
	override func didReceiveMemoryWarning() {
		
		super.didReceiveMemoryWarning()
	}
	
	func showAlert(message: String) {
		
		let alertController = UIAlertController(title: "", message: message, preferredStyle: .alert)
		
		let OKAction = UIAlertAction(title: "OK", style: .default, handler: nil)
		alertController.addAction(OKAction)
		
		self.present(alertController, animated: true, completion: nil)
		
	}
	
	@IBAction func updatePassword() {
		
		guard let oldPassword = oldPasswordField.text, let newPassword = newPasswordField.text else {
			
			showAlert(message: "Please provide value in both the fields")
			
			return
		}
		
		let context	= NSManagedObjectContext.mr_default()
		
		guard let emailId = defaults.object(forKey: "loggedInUserEmail") as? String, let user: UserInfo = UserInfo.mr_findFirst(byAttribute: "emailId", withValue: emailId) as? UserInfo else {
			
			showAlert(message: "User data is not available in DB")
			
			return
		}
		
		guard let password = user.password, password == oldPassword else {
			
			showAlert(message: "Please provide old password")
			
			return
		}
		
		user.password = newPassword
		
		context?.mr_saveToPersistentStore(completion: { (response, error) in
			
			if response {
				
				self.showAlert(message: "Password Updated")
				
				return
			}
			self.showAlert(message: "Oops! password not able to change")
		})
	}
}
