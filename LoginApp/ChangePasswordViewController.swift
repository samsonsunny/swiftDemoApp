//
//  ForgotPasswordViewController.swift
//  LoginApp
//
//  Created by Sam on 25/01/17.
//  Copyright © 2017 Sam. All rights reserved.
//

import UIKit

class ChangePasswordViewController: UIViewController {
	
	@IBOutlet weak var currentPassword: UITextField!
	@IBOutlet weak var newPassword: UITextField!
	@IBOutlet weak var navigationBar: UINavigationItem!
	
	@IBOutlet var oldPassword: String?
	
	let defaults = UserDefaults.standard

	override func viewDidLoad() {
		super.viewDidLoad()
//		navigationBar.title = "Change Password"
		print(oldPassword!)
	}
	
	override func didReceiveMemoryWarning() {
		super.didReceiveMemoryWarning()
	}
	
	@IBAction func updatePassword() {
		
		if let currentPass: String = currentPassword.text, currentPass.characters.count > 0, let newPass: String = newPassword.text, newPass.characters.count > 0{
			
			let password = oldPassword ?? ""
			
			if password == currentPass {
				
				if var userDatabase:[String: String] = defaults.dictionary(forKey: "userDatabase")as? [String : String]  {
					
					if let key = defaults.object(forKey: "loggedInUser") as? String {
						
						userDatabase[key] = newPass
						defaults.set(userDatabase, forKey: "userDatabase")
						defaults.synchronize()
					}
				}
				self.dismiss(animated: true, completion: nil)
			}else{
				print("please enter correct old password")
			}
		}else{
			print("please enter both the fields")
		}

	}
	
	@IBAction func closePage() {
		self.dismiss(animated: true, completion: nil)
	}
	
}
