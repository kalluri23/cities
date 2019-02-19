# cities
Mobile app to show list of cities and view it on a map

# Architectire
MVVM architecture is used to build this app

# Build requirements
Xcode 9.3 and above, builds with iOS 10.0 and above, supporting both iPad and iPhone in all screen orientations

# Model
BBCity.swift file contains the City model object that is responsible parsing data from Datlayer

loadCities function will parse cities.json file and returns array of city objects


# View Model
BBCitiesListViewModel.swift will fetch list of cities and reloads tableview. searchCities function will query list of cities matching supplied string and reloads the tableview

BBDetailViewModel.swift will be responsible for refreshing map and about details on detail view controller, it will use the city property to refresh data

# View
BBSplitViewController.swift is responsible for showing master detail screens based on screen orientation and device type

BBListViewController.swift is responsible for showing the obtained cities list in a table view. Click on a cell will open a map in next screen on iPhones and it will show map in detail on iPads. Click on info accessory button will load the details of the city in detail screen instead of showing a map

BBDetailViewController.swift listens to click events on master screen and refreshes its data accordingly

# Data Layer
It has a cities.json file containing about 200k cities information accross the world in JSON format. This acts as a core data feed for the app.

# Unit Tests
Run the unit tests to see if this app is filetering results when we provide "Alb", "abab" and "al" as serach criteria
