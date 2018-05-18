//
//  Cau3ViewController.swift
//  GIS
//
//  Created by Ivan on 5/17/18.
//  Copyright © 2018 francis. All rights reserved.
//

import UIKit

class Cau3ViewController: UIViewController {

	@IBOutlet weak var locationz1: UITextField!
	@IBOutlet weak var locationz2: UITextField!
	override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

	override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
		if let des : MapViewController = segue.destination as? MapViewController {
			des.locationZ1 = locationz1.text!
			des.locationZ2 = locationz2.text!
			
			des.sttQuestion = 3
		}
	}
}
