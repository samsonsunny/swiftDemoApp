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
	
	@IBOutlet weak var emailField: UILabel!
	
	@IBOutlet weak var nameField: UILabel!
	
	@IBOutlet weak var changePasswordCell: UITableViewCell!
	
	var name: String = ""
	
	var email: String = ""
	
	var isShowChangePassword: Bool = true

	
	override func viewDidLoad() {
		
		super.viewDidLoad()
		
		self.navigationItem.title = "Profile"
		
		self.tableView.tableFooterView = UIView()
		
		emailField.text = email
		
		nameField.text = name
		
		if !isShowChangePassword {
			
			self.changePasswordCell.isHidden = true
		}
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

