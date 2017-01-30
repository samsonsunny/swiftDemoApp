//
//  MainTabBarController.swift
//  LoginApp
//
//  Created by Sam on 27/01/17.
//  Copyright © 2017 Sam. All rights reserved.
//

import UIKit

class MainTabBarController: UITabBarController {
	
	let defaults = UserDefaults.standard
	
	override func viewDidLoad() {
		
		super.viewDidLoad()
		
		// if not logged in go to main login page
		
		

		if !defaults.bool(forKey: "isLoggedIn") {
			
			print("not logged in")
			
			if let nextViewController = self.storyboard?.instantiateViewController(withIdentifier: "MainViewControllerID") as? MainViewController {
				
				self.navigationController?.pushViewController(nextViewController, animated: true)
			}
		}else{
			
			self.selectedIndex = 1
			
			}
	}
	
	override func didReceiveMemoryWarning() {
		super.didReceiveMemoryWarning()
	}
	
}

