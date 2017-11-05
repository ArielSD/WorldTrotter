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
		
		let standardString = NSLocalizedString("Standard", comment: "Standard map view")
		let satelliteString = NSLocalizedString("Satellite", comment: "Satellite map view")
		let hybridString = NSLocalizedString("Hybrid", comment: "Hybrid map view")
		let segmentedControl = UISegmentedControl(items: [standardString, satelliteString, hybridString])
		segmentedControl.backgroundColor = UIColor.white.withAlphaComponent(0.5)
		segmentedControl.selectedSegmentIndex = 0
		
		segmentedControl.addTarget(self, action: #selector(MapViewController.mapTypeChanged(_:)), for: .valueChanged)
		
		segmentedControl.translatesAutoresizingMaskIntoConstraints = false
		view.addSubview(segmentedControl)
		
		let margins = view.layoutMarginsGuide
		let topConstraint = segmentedControl.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 8)
		let leadingConstraint = segmentedControl.leadingAnchor.constraint(equalTo: margins.leadingAnchor)
		let trailingConstraint = segmentedControl.trailingAnchor.constraint(equalTo: margins.trailingAnchor)
		
		topConstraint.isActive = true
		leadingConstraint.isActive = true
		trailingConstraint.isActive = true
	}
	
	override func viewDidLoad() {
		super.viewDidLoad()
		
		print("MapViewController loaded its view.")
	}
	
	@objc func mapTypeChanged(_ segmentedControl: UISegmentedControl) {
		switch segmentedControl.selectedSegmentIndex {
		case 0:
			mapView.mapType = .standard
		case 1:
			mapView.mapType = .hybrid
		case 2:
			mapView.mapType = .satellite
		default:
			break
		}
	}
}
