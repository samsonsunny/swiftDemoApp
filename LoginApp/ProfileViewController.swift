//
//  ProfileViewController.swift
//  LoginApp
//
//  Created by Sam on 31/01/17.
//  Copyright © 2017 Sam. All rights reserved.
//

import UIKit

class ProfileViewController: UITableViewController{

	let defaults = UserDefaults.standard
	
	@IBOutlet weak var userName: UILabel!
	
	@IBOutlet weak var email: UILabel!

	override func viewDidLoad() {
		
		super.viewDidLoad()
		
		self.navigationItem.title = "Profile"
		
		self.tableView.tableFooterView = UIView()
		
		userName.text = defaults.object(forKey: "loggedInUserEmail") as? String
		
		email.text = defaults.object(forKey: "loggedInUser") as? String
	}
	
	override func didReceiveMemoryWarning() {
		
		super.didReceiveMemoryWarning()
	}
	
	override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
		if indexPath.row == 2 {
			
			resetPassword()
		}
	}
	
	func resetPassword() {
		
		if let nextViewController = self.storyboard?.instantiateViewController(withIdentifier: "ChangePasswordViewControllerID") as? ChangePasswordViewController {
			
			self.navigationController?.pushViewController(nextViewController, animated: true)
		}
	}
}

