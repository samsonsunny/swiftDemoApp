//
//  SettingsViewController.swift
//  LoginApp
//
//  Created by Sam on 27/01/17.
//  Copyright © 2017 Sam. All rights reserved.
//

import UIKit

class SettingsViewController: UITableViewController{
	
	let defaults = UserDefaults.standard
	
	override func viewDidLoad() {
		
		super.viewDidLoad()
		
		self.tabBarController?.selectedIndex = 2
		
		self.tableView.tableFooterView = UIView()
	}
	
	override func viewWillAppear(_ animated: Bool) {
		
		super.viewWillAppear(true)
		
		self.tabBarController?.title = "Settings"
	}
	
	override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
		
		if indexPath.section == 0 {
			
			if let nextViewController = self.storyboard?.instantiateViewController(withIdentifier: "ProfileViewControllerID") as? ProfileViewController {
				
				nextViewController.name = defaults.object(forKey: "loggedInUser") as! String
				
				nextViewController.email = defaults.object(forKey: "loggedInUserEmail") as! String
				
				self.navigationController?.pushViewController(nextViewController, animated: true)
			}
		}else if indexPath.section == 1 {
			
			showAlert(message: "Sure you want to logout?")
		}
	}
	
	func doLogout(action: UIAlertAction) {
		
		defaults.set(false, forKey: "isLoggedIn")
		
		if let nextViewController = self.storyboard?.instantiateViewController(withIdentifier: "NavigationControllerID") as? NavigationController {
			
			let appDelegate = UIApplication.shared.delegate as! AppDelegate
			
			appDelegate.window?.rootViewController = nextViewController
		}
	}
	
	func showAlert(message: String) {
		
		let alertController = UIAlertController(title: "", message: message, preferredStyle: .alert)
		
		let OKAction = UIAlertAction(title: "OK", style: .default, handler: doLogout)
		
		alertController.addAction(OKAction)
		
		let CancelAction = UIAlertAction(title: "Cancel", style: .default, handler: nil)
		
		alertController.addAction(CancelAction)
		
		self.present(alertController, animated: true, completion: nil)
	}
}
