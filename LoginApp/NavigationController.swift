//
//  NavigationController.swift
//  LoginApp
//
//  Created by Sam on 27/01/17.
//  Copyright © 2017 Sam. All rights reserved.
//

import UIKit

class NavigationController: UINavigationController {
	
	let defaults = UserDefaults.standard
	
	override func viewDidLoad() {
		
		super.viewDidLoad()
		
		if defaults.bool(forKey: "isLoggedIn") {
			
			if let nextViewController = self.storyboard?.instantiateViewController(withIdentifier: "MainTabBarControllerID") as? MainTabBarController {
				
				let appDelegate = UIApplication.shared.delegate as! AppDelegate
				appDelegate.window?.rootViewController = nextViewController
				
				//	self.pushViewController(nextViewController, animated: true)
				
				//self.show(nextViewController, sender: nil)
				//	self.present(nextViewController, animated: true, completion: nil)
			}
		}
	}
	
	override func viewWillAppear(_ animated: Bool) {
		
		super.viewWillAppear(true)
		
	}
	
	override func didReceiveMemoryWarning() {
		
		super.didReceiveMemoryWarning()
		
	}
	
}
