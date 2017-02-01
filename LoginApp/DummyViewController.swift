//
//  DummyViewController.swift
//  LoginApp
//
//  Created by Sam on 27/01/17.
//  Copyright © 2017 Sam. All rights reserved.
//

import UIKit

class DummyViewController: UIViewController {
	
	override func viewDidLoad() {
		
		super.viewDidLoad()
		
		self.tabBarController?.selectedIndex = 0
		
		self.navigationItem.title = "Dummy Page"
		
	}
	
	override func didReceiveMemoryWarning() {
		
		super.didReceiveMemoryWarning()
		
	}
}

