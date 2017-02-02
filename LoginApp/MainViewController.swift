//
//  MainViewController.swift
//  LoginApp
//
//  Created by Sam on 25/01/17.
//  Copyright © 2017 Sam. All rights reserved.
//

import UIKit

class MainViewController: UIViewController {
	
	
	override func viewDidLoad() {
		
		super.viewDidLoad()
		
	}
	
	override func viewWillAppear(_ animated: Bool) {
		
		super.viewWillAppear(true)
	}
	
	override func didReceiveMemoryWarning() {
		
		super.didReceiveMemoryWarning()
	}
	
	@IBAction func showLoginPage() {
		if let nextViewController = self.storyboard?.instantiateViewController(withIdentifier: "LoginViewControllerID") as? LoginViewController {
			
			if self.navigationController != nil {
				
				self.navigationController?.pushViewController(nextViewController, animated: true)
			}
		}
	}
	
	@IBAction func showSignupPage() {
		
		if let nextViewController = self.storyboard?.instantiateViewController(withIdentifier: "SignupViewControllerID") as? SignupViewController {
			
			self.navigationController?.pushViewController(nextViewController, animated: true)
		}
	}
	
}
