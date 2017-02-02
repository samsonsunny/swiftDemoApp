//
//  UsersTableViewCell.swift
//  LoginApp
//
//  Created by Sam on 01/02/17.
//  Copyright © 2017 Sam. All rights reserved.
//

import UIKit

class UsersTableViewCell: UITableViewCell {
	
	@IBOutlet weak var name: UILabel!
	
	override func setSelected(_ selected: Bool, animated: Bool) {
	
		super.setSelected(true, animated: true)
	}
}
