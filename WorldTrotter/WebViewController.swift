//
//  WebViewController.swift
//  WorldTrotter
//
//  Created by Ariel Scott-Dicker on 2017-10-17.
//  Copyright © 2017 Ariel Scott-Dicker. All rights reserved.
//

import UIKit
import WebKit

class WebViewController: UIViewController, WKUIDelegate {
	var webView: WKWebView!
	
	override func loadView() {
		let webConfiguration = WKWebViewConfiguration()
		webView = WKWebView(frame: .zero, configuration: webConfiguration)
		webView.uiDelegate = self
		view = webView
	}
	
	override func viewDidLoad() {
		super.viewDidLoad()
		
		let url = URL(string: "https://www.bignerdranch.com/")
		let request = URLRequest(url: url!)
		webView.load(request)
	}
}
