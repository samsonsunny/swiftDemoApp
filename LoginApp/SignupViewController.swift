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
	
	@IBOutlet weak var userName: UITextField!
	
	@IBOutlet weak var password: UITextField!
	
	@IBOutlet weak var emailId: UITextField!
	
	let defaults = UserDefaults.standard
	
	override func viewDidLoad() {
		
		super.viewDidLoad()
		
//		var response = self.validate(email: emailId.text, password: password.text, name: userName.text)
		
		//		var isDetailsStored = true
	}
	
	override func viewWillAppear(_ animated: Bool) {
		
		super.viewWillAppear(true)
	
	}
	
	override func didReceiveMemoryWarning() {
		
		super.didReceiveMemoryWarning()
	}
	
	func validate(email: String, password: String, name: String) -> String {
		
		return "Validated User Details"
	}
	
	@IBAction func registerUser() {
		
//		let context = NSManagedObjectContext.mr_default()
//		
//		let userInfo: UserInfo = UserInfo.mr_create(in: context) as! UserInfo
//		
//		userInfo.emailId = "hello@hello.com"
//		userInfo.password = "password"
//		userInfo.userName = "test"
//		
//		context?.mr_saveToPersistentStoreAndWait()
//		
//			context?.mr_saveToPersistentStore(completion: nil)
		
		
		if let name: String = userName.text, name.characters.count > 0, let tempPassword: String = password.text, tempPassword.characters.count > 0{
			
			print(name)
			print(tempPassword)
			
			if let userDatabaseDict:[String: String] = defaults.dictionary(forKey: "userDatabase")as? [String : String] {
				var userDatabase = userDatabaseDict
				userDatabase[name] = tempPassword
				defaults.set(userDatabase, forKey: "userDatabase")
				defaults.set(name, forKey: "loggedInUser")
				defaults.set(true, forKey: "isLoggedIn")
				defaults.synchronize()
				
				if let nextViewController = self.storyboard?.instantiateViewController(withIdentifier: "WelcomeViewControllerID") as? WelcomeViewController {
					
					self.navigationController?.pushViewController(nextViewController, animated: true)
				}

			}else{
				var userDatabase = [String: String]()
				userDatabase[name] = tempPassword
				defaults.set(userDatabase, forKey: "userDatabase")
				defaults.set(name, forKey: "loggedInUser")
				defaults.synchronize()

				if let nextViewController = self.storyboard?.instantiateViewController(withIdentifier: "WelcomeViewControllerID") as? WelcomeViewController {
					
					self.navigationController?.pushViewController(nextViewController, animated: true)
				}
			}
			
		}else {
			print("please enter user name and password")
		}

	}
	
	override func viewWillDisappear(_ animated: Bool) {
		super.viewWillDisappear(true)
		print(defaults.dictionary(forKey: "userDatabase") ?? "no value")
	}
}
