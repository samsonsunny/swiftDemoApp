//
//  WelcomeViewController.swift
//  LoginApp
//
//  Created by Sam on 25/01/17.
//  Copyright © 2017 Sam. All rights reserved.
//

import UIKit

class WelcomeViewController: UIViewController {
	
	@IBOutlet weak var welcomeLabel: UILabel!
	
	let defaults = UserDefaults.standard

	override func viewDidLoad() {
		
		super.viewDidLoad()
		
		self.tabBarController?.selectedIndex = 1
		
		self.navigationItem.title = "Home Page"
		
		let emailId = defaults.object(forKey: "loggedInUserEmail") as? String
		
		if let user: UserInfo = UserInfo.mr_findFirst(byAttribute: "emailId", withValue: emailId) as? UserInfo
		{
			if let name = user.userName {
				renderWelcome(message: name)
			}
		}		
	}
	
	override func viewWillAppear(_ animated: Bool) {
		
		super.viewWillAppear(true)
		
	}
	
	func renderWelcome(message: String) {
		
		welcomeLabel.text = "Welcome \(message)"
		
	}
	
	override func didReceiveMemoryWarning() {
		
		super.didReceiveMemoryWarning()
		
	}
}
