//
//  BBDetailViewController.swift
//  Cities
//
//  Created by Krishna teja Kalluri on 2/17/19.
//  Copyright © 2019 backbase. All rights reserved.
//

import UIKit
import MapKit

class BBDetailViewController: UIViewController {

    @IBOutlet weak var mapView: MKMapView!
    var city: BBCity? {
        didSet {
            loadViewIfNeeded()
            refreshUI()
        }
    }
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }
    
    private func refreshUI() {
        let allAnnotations = self.mapView.annotations
        self.mapView.removeAnnotations(allAnnotations)
        guard let city = self.city else {
            return
        }
        let center = CLLocationCoordinate2D(latitude: city.coord.lat, longitude: city.coord.lon)
        let region = MKCoordinateRegion(center: center, span: MKCoordinateSpan(latitudeDelta: 0.01, longitudeDelta: 0.01))
        
        //set region on the map
        self.mapView.setRegion(region, animated: true)
        let newPin = MKPointAnnotation()
        
        newPin.coordinate = center
        self.mapView.addAnnotation(newPin)
    }

}

extension BBDetailViewController: BBCitySelectionDelegate {
    func citySelected(_ city: BBCity) {
        self.city = city
    }
}

extension BBDetailViewController: MKMapViewDelegate {
    
}
