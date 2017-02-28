//
//  BusinessesViewController.swift
//  Yelp
//
//  Created by Chau Vo on 10/17/16.
//  Copyright © 2016 CoderSchool. All rights reserved.
//

import UIKit

class BusinessesViewController: UIViewController {

    var businesses: [Business]!

    @IBOutlet weak var tableView: UITableView!
    var searchBar: UISearchBar!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.delegate = self
        tableView.dataSource = self
        
        tableView.estimatedRowHeight = 100
        tableView.rowHeight = UITableViewAutomaticDimension
        
        searchBar = UISearchBar()
        searchBar.sizeToFit()
        navigationItem.titleView = searchBar
        searchBar.delegate = self
        
        
        Business.search(with: "Thai") { (businesses: [Business]?, error: Error?) in
            if let businesses = businesses {
                self.businesses = businesses

                for business in businesses {
                    print(business.name!)
                    print(business.address!)
                }
                
                self.tableView.reloadData()
            }
        }

        // Example of Yelp search with more search options specified
        /*
        Business.search(with: "Restaurants", sort: .Distance, categories: ["asianfusion", "burgers"], deals: true) { (businesses: [Business]?, error: Error?) in
            if let businesses = businesses {
                self.businesses = businesses

                for business in businesses {
                    print(business.name!)
                    print(business.address!)
                }
            }
        }
        */
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        let navVC = segue.destination as! UINavigationController
        let filterVC = navVC.topViewController as! FiltersViewController
        filterVC.delegate = self
    }

}

extension BusinessesViewController: UITableViewDataSource, UITableViewDelegate, FiltersViewControllerDelegate, UISearchBarDelegate {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        if businesses == nil {
            return 0
        } else {
            return businesses.count
        }
        
    }
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "businessCell") as! BusinessCell
        cell.business = businesses[indexPath.row]
        return cell
    }
    
    func filtersViewController(filterVC: FiltersViewController, didUpdateFilter filter: [String], sortMode: YelpSortMode, deals: Bool) {
        print("got new filters \(filter)")
//        search(keyword: "", filters: filter)
//        fullSearch(keyword: "", filters: filter, sort: sortMode, deals: deals)
    }
    
    func filtersViewController(filterVC: FiltersViewController, didUpdateFilter filter: [String],  sortmode: YelpSortMode, hasDeals: Bool, distance: String ){
        fullSearch(keyword: searchBar.text ?? "", filters: filter, sort: sortmode, deals: hasDeals, distance: distance)
    }
    func searchBarTextDidBeginEditing(_ searchBar: UISearchBar) {
        searchBar.showsCancelButton = true
    }
    func searchBarCancelButtonClicked(_ searchBar: UISearchBar) {
        searchBar.showsCancelButton = false
        searchBar.text = ""
        searchBar.resignFirstResponder()
        search(keyword: "", filters: [""])
    }
    func searchBarSearchButtonClicked(_ searchBar: UISearchBar) {
        let searchKeyword = searchBar.text ?? ""
        search(keyword: searchKeyword, filters: [""])
        searchBar.resignFirstResponder()
    }
    func search(keyword: String, filters: [String]){
        Business.search(with: keyword, sort: nil, categories: filters, deals: nil){(businesses: [Business]?, error: Error?) in
            if let businesses = businesses {
                self.businesses = businesses
                self.tableView.reloadData()
            }
        }
    }
    func fullSearch(keyword: String, filters: [String], sort: YelpSortMode, deals: Bool, distance: String){
        
        Business.search(with: keyword, sort: YelpSortMode(rawValue: sort.rawValue), categories: filters, deals: deals){(businesses: [Business]?, error: Error?) in
            if let businesses = businesses {
                self.businesses = businesses
                self.tableView.reloadData()
            }
        }
    }
}
