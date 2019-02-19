//
//  BBListViewController.swift
//  Cities
//
//  Created by Krishna teja Kalluri on 2/17/19.
//  Copyright © 2019 backbase. All rights reserved.
//

import UIKit

protocol BBCitySelectionDelegate: class {
    func citySelected(_ city: BBCity)
    func infoButtonTapped(_ city: BBCity)
}

class BBListViewController: UIViewController {
    @IBOutlet weak var viewModel: BBCitiesListViewModel!
    @IBOutlet weak var cityListTableView: UITableView!
    @IBOutlet weak var activityIndicator: UIActivityIndicatorView!
    weak var selectionDelegate: BBCitySelectionDelegate?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.activityIndicator.startAnimating()
        self.cityListTableView.estimatedRowHeight = UITableView.automaticDimension
        self.viewModelBinding()
        self.viewModel.fetchCities()
    }
    
    private func viewModelBinding()  {
        viewModel.reloadData = { [unowned self] in
            DispatchQueue.main.async {
                self.cityListTableView.reloadData()
                self.activityIndicator.stopAnimating()
            }
        }
    }

}

extension BBListViewController: UITableViewDataSource {
    func numberOfSections(in tableView: UITableView) -> Int {
        return viewModel.numberOfSections
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return viewModel.numberOfRows
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cityCell = tableView.dequeueReusableCell(withIdentifier: "BBCityCell", for: indexPath) as! BBCityCell
        cityCell.configure(withCity: viewModel.cityAtIndex(index: indexPath.row))
        return cityCell
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return UITableView.automaticDimension
    }
    
}

extension BBListViewController: UITableViewDelegate {
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        if let detailViewController =  selectionDelegate as? BBDetailViewController,
            let detailNavigationController = detailViewController.navigationController {
            selectionDelegate?.citySelected(viewModel.cityAtIndex(index: indexPath.row))
            splitViewController?.showDetailViewController(detailNavigationController, sender: nil)
        }
    }
    
    func tableView(_ tableView: UITableView, accessoryButtonTappedForRowWith indexPath: IndexPath) {
        if let detailViewController =  selectionDelegate as? BBDetailViewController,
            let detailNavigationController = detailViewController.navigationController {
            selectionDelegate?.infoButtonTapped(viewModel.cityAtIndex(index: indexPath.row))
            splitViewController?.showDetailViewController(detailNavigationController, sender: nil)
        }
    }
}

extension BBListViewController: UISearchBarDelegate {
    
    func searchBar(_ searchBar: UISearchBar, textDidChange searchText: String) {
        if searchText == "" {
            searchBar.resignFirstResponder()
            self.viewModel.searchCities()
            return
        }
        self.viewModel.searchCities(matching: searchText)
    }
    
    func searchBarCancelButtonClicked(_ searchBar: UISearchBar) {
        searchBar.resignFirstResponder()
        self.viewModel.searchCities()
    }
    
    func searchBarSearchButtonClicked(_ searchBar: UISearchBar) {
        searchBar.resignFirstResponder()
        self.viewModel.searchCities(matching: searchBar.text)
    }
    
}
