//
//  SettingsViewController.swift
//  LoginApp
//
//  Created by Sam on 27/01/17.
//  Copyright © 2017 Sam. All rights reserved.
//

import UIKit

class SettingsViewController: UIViewController {
	
	let defaults = UserDefaults.standard
	
	override func viewDidLoad() {
		
		super.viewDidLoad()
		
		self.tabBarController?.selectedIndex = 2
		
	}
	
	override func viewWillAppear(_ animated: Bool) {
		
		super.viewWillAppear(true)
		
	}
	
	@IBAction func resetPassword() {
		
		if let nextViewController = self.storyboard?.instantiateViewController(withIdentifier: "ChangePasswordViewControllerID") as? ChangePasswordViewController {
			
			if let userDatabase:[String: String] = defaults.dictionary(forKey: "userDatabase") as? [String : String]{
				
				if let key: String = defaults.object(forKey: "loggedInUser") as? String{
					
					if let password: String = userDatabase[key] {
						print(password)
						
						nextViewController.oldPassword = password
					}
				}
			}
			self.present(nextViewController, animated: true, completion: nil)
		}
	}
	
	@IBAction func logoutAction() {
		
		defaults.set(false, forKey: "isLoggedIn")
		
		if let nextViewController = self.storyboard?.instantiateViewController(withIdentifier: "MainViewControllerID") as? MainViewController {
			
			self.navigationController?.pushViewController(nextViewController, animated: false)
			
		}
	}
}
