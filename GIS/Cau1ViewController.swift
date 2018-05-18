//
//  Cau1ViewController.swift
//  GIS
//
//  Created by Ivan on 5/17/18.
//  Copyright © 2018 francis. All rights reserved.
//

import UIKit
import GoogleMaps
import GooglePlaces

class Cau1ViewController: UIViewController {

	@IBOutlet weak var z1: UITextField!
	@IBOutlet weak var z2: UITextField!
	
	override func viewDidLoad() {
        super.viewDidLoad()

    }
	
	override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
		if let des:MapViewController = segue.destination as? MapViewController{
			des.sttQuestion = 1
			des.locationZ1 = z1.text!
			des.locationZ2 = z2.text!
		}
	}
}
