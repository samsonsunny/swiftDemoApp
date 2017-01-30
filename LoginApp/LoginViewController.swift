//
//  LoginViewController.swift
//  LoginApp
//
//  Created by Sam on 25/01/17.
//  Copyright © 2017 Sam. All rights reserved.
//

import UIKit

class LoginViewController: UIViewController {
	
	@IBOutlet weak var userName: UITextField!

	@IBOutlet weak var password: UITextField!
	
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
	
	@IBAction func checkLoginCredentials() {
		
//		let array = UserInfo.mr_findAll() as? [UserInfo]
//		
//		print(array?.first?.emailId)

		if let name: String = userName.text, name.characters.count > 0, let tempPassword: String = password.text, tempPassword.characters.count > 0{
			
			if let userDatabase:[String: String] = defaults.dictionary(forKey: "userDatabase") as? [String : String]  {
				
				if userDatabase[name] != nil, userDatabase[name] == tempPassword {
					print("correct password")
					
					defaults.set(name, forKey: "loggedInUser")
					
					defaults.set(true, forKey: "isLoggedIn")
					
					defaults.synchronize()
					
					
					
					if let nextViewController = self.storyboard?.instantiateViewController(withIdentifier: "MainTabBarControllerID") as? MainTabBarController {

						self.navigationController?.pushViewController(nextViewController, animated: true)
					}


				}else{
					print("please enter correct user name and password")
				}
			}else{
				print("no one registered")
			}
			
		}else {
			print("please enter user name and password")
		}

	}

	
}
