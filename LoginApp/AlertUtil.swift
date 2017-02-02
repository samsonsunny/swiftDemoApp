//
//  AlertUtil.swift
//  LoginApp
//
//  Created by Sam on 02/02/17.
//  Copyright © 2017 Sam. All rights reserved.
//

import Foundation
import UIKit

class AlertUtil {
	
	func showAlert(message: String, on controller: UIViewController) {
		
		let alertController = UIAlertController(title: "", message: message, preferredStyle: .alert)
		
		let OKAction = UIAlertAction(title: "OK", style: .default, handler: nil)
		
		alertController.addAction(OKAction)
		
		controller.present(alertController, animated: true, completion: nil)
	}
	
	func showAlert(message: String, OKAction: UIAlertAction, on controller: UIViewController) {
		
		let alertController = UIAlertController(title: "", message: message, preferredStyle: .alert)
		
		alertController.addAction(OKAction)
		
		let CancelAction = UIAlertAction(title: "Cancel", style: .default, handler: nil)
		
		alertController.addAction(CancelAction)
		
		controller.present(alertController, animated: true, completion: nil)
	}
}
