//
//  MapViewController.swift
//  GIS
//
//  Created by francis on 4/10/18.
//  Copyright © 2018 francis. All rights reserved.
//

import UIKit
import GoogleMaps
import GooglePlaces
import Alamofire

class MapViewController: UIViewController {
	
	var sttQuestion = 0
	var locationZ1 = ""
	var locationZ2 = ""
	
    override func viewDidLoad() {
        //super.viewDidLoad()
        let camera = GMSCameraPosition.camera(withLatitude: 37.36, longitude: -122, zoom: 10.0)
        let mapView = GMSMapView.map(withFrame: CGRect.zero, camera: camera)
        view = mapView
        
        // Creates a marker in the center of the map.
        let marker = GMSMarker()
        marker.position = CLLocationCoordinate2D(latitude: 37.36, longitude: -122)
        marker.title = "Sydney"
        marker.snippet = "Australia"
        marker.map = mapView

	//add path to google map api
	let path = GMSMutablePath()
	path.add(CLLocationCoordinate2D(latitude: 37.36, longitude: -122.0))
	path.add(CLLocationCoordinate2D(latitude: 37.45, longitude: -122.0))
	path.add(CLLocationCoordinate2D(latitude: 37.45, longitude: -122.2))
	path.add(CLLocationCoordinate2D(latitude: 37.36, longitude: -122.2))
	path.add(CLLocationCoordinate2D(latitude: 37.36, longitude: -122.0))
	
	let rectangle = GMSPolyline(path: path)
	rectangle.map = mapView
	
	//mapView.clear()
	
	switch sttQuestion {
	case 1:
		print("cau 1")
		//let location1 = getLocationFromText(text: locationZ1)
		//let location2 = getLocationFromText(text: locationZ2)
	case 2 :
		print("cau 2")
	case 3 :
		print("cau 3")
		self.getPathFrom2location(location1: locationZ1, location2: locationZ2)
	case 4 :
		print("cau 4")
	case 5 :
		print("cau 5")
	default:
		print("Error!")
	}
    }
	
	func getLocationFromText(text: String) ->CLLocationCoordinate2D{
		var lat:Double = 0.0
		var long:Double = 0.0
		Alamofire.request("https://maps.googleapis.com/maps/api/geocode/json?address=" + text + "&key=AIzaSyBJYKwq_RAzpVgxokw7YwwPhaeIz75o2Ws").responseJSON(completionHandler: {response in
			do {
				if let JSON = response.result.value as? [String: AnyObject]{
					//print(JSON["results"] as! [[String:AnyObject]])
					let J2 = JSON["results"] as! [[String:AnyObject]]
					for i in J2 {
						for j in i{
							if j.key == "geometry"{
								let j3 = j.value["location"]! as! [String:Double]
								print("lat: \(String(describing: j3["lat"] ))")
								print("long: \(String(describing: j3["lng"]))")
								
								lat = j3["lat"]!
								long = j3["lng"]!
								break
							}
						}
					}
				}
			}
		})
		return CLLocationCoordinate2D(latitude: lat, longitude: long)
	}
	
	func getPathFrom2location(location1: String, location2: String)/* -> [Double:Double]*/{
		let url = "https://maps.googleapis.com/maps/api/directions/json?origin=" + location1 + "&destination=" + location2 + "&avoid=highways&mode=WALKING&key=AIzaSyBJYKwq_RAzpVgxokw7YwwPhaeIz75o2Ws"
		Alamofire.request(url).responseJSON(completionHandler: {response in
			if let returnData = String(data: response.data!, encoding: .utf8) {
				print("return Data: \(returnData)")
			} else {
				print("cannot convert data to string")
			}
		})
	}
}

