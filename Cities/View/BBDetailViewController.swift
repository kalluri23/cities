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

    @IBOutlet weak var aboutTableView: UITableView!
    @IBOutlet weak var viewModel: BBDetailViewModel!
    @IBOutlet weak var mapView: MKMapView!

    override func viewDidLoad() {
        super.viewDidLoad()
        self.aboutTableView.estimatedRowHeight = UITableView.automaticDimension
        viewModelBinding()
        // Do any additional setup after loading the view.
    }
    
    private func refreshMap() {
        loadViewIfNeeded()
        self.aboutTableView.isHidden = true
        self.mapView.isHidden = false
        self.view.bringSubviewToFront(self.mapView)
        let allAnnotations = self.mapView.annotations
        self.mapView.removeAnnotations(allAnnotations)
        guard let city = viewModel.city else {
            return
        }
        let center = CLLocationCoordinate2D(latitude: city.coord.lat, longitude: city.coord.lon)
        let region = MKCoordinateRegion(center: center, span: MKCoordinateSpan(latitudeDelta: 0.01, longitudeDelta: 0.01))
        
        self.mapView.setRegion(region, animated: true)
        let newPin = MKPointAnnotation()
        
        newPin.coordinate = center
        self.mapView.addAnnotation(newPin)
    }
    
    private func refreshAbout() {
        self.mapView.isHidden = true
        self.aboutTableView.isHidden = false
        self.view.bringSubviewToFront(self.aboutTableView)
        self.aboutTableView.reloadData()
    }
    
    private func viewModelBinding()  {
        viewModel.reloadMap = { [unowned self] in
            DispatchQueue.main.async {
                self.refreshMap()
            }
        }
        viewModel.reloadAbout = { [unowned self] in
            DispatchQueue.main.async {
                self.refreshAbout()
            }
        }
    }
    
    

}

extension BBDetailViewController: BBCitySelectionDelegate {
    func infoButtonTapped(_ city: BBCity) {
        viewModel.city = city
        viewModel.reloadAbout?()
    }
    
    func citySelected(_ city: BBCity) {
        viewModel.city = city
        viewModel.reloadMap?()
    }
}

extension BBDetailViewController: UITableViewDataSource {
    func numberOfSections(in tableView: UITableView) -> Int {
        return viewModel.numberOfSections
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return viewModel.numberOfRows
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let aboutCell = tableView.dequeueReusableCell(withIdentifier: "BBAboutCell", for: indexPath) as! BBAboutCell
        viewModel.configure(cell: aboutCell, atIndexPath: indexPath)
        return aboutCell
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return UITableView.automaticDimension
    }
    
}

