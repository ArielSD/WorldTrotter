//
//  MapViewController.swift
//  WorldTrotter
//
//  Created by Ariel Scott-Dicker on 2017-10-15.
//  Copyright © 2017 Ariel Scott-Dicker. All rights reserved.
//

import UIKit
import MapKit

class MapViewController: UIViewController {
	var mapView: MKMapView!
	
	override func loadView() {
		// Create a MapView
		mapView = MKMapView()
		
		// Set it as *the* view of this view controller
		view = mapView
		
		let segmentedControl = UISegmentedControl(items: ["Standard", "Hybrid", "Satellite"])
		segmentedControl.backgroundColor = UIColor.white.withAlphaComponent(0.5)
		segmentedControl.selectedSegmentIndex = 0
		
		segmentedControl.translatesAutoresizingMaskIntoConstraints = false
		view.addSubview(segmentedControl)
		
		let topConstraint = segmentedControl.topAnchor.constraint(equalTo: view.topAnchor)
		let leadingConstraint = segmentedControl.leadingAnchor.constraint(equalTo: view.leadingAnchor)
		let trailingConstraint = segmentedControl.trailingAnchor.constraint(equalTo: view.trailingAnchor)
	}
	
	override func viewDidLoad() {
		super.viewDidLoad()
		
		print("MapViewController loaded its view.")
	}
}
