//
//  FiltersViewController.swift
//  Yelp
//
//  Created by LVMBP on 2/23/17.
//  Copyright © 2017 CoderSchool. All rights reserved.
//

import UIKit

protocol FiltersViewControllerDelegate {
    func filtersViewController(filterVC: FiltersViewController, didUpdateFilter filter: [String],  sortmode: YelpSortMode, hasDeals: Bool, distance: String )
}
class FiltersViewController: UIViewController {
    @IBOutlet weak var tableView: UITableView!
    let categories: [[String: String]] =
        [["name" : "Afghan", "code": "afghani"],
         ["name" : "African", "code": "african"],
         ["name" : "American, New", "code": "newamerican"],
         ["name" : "American, Traditional", "code": "tradamerican"],
         ["name" : "Arabian", "code": "arabian"],
         ["name" : "Argentine", "code": "argentine"],
         ["name" : "Armenian", "code": "armenian"],
         ["name" : "Asian Fusion", "code": "asianfusion"],
         ["name" : "Asturian", "code": "asturian"],
         ["name" : "Australian", "code": "australian"],
         ["name" : "Austrian", "code": "austrian"],
         ["name" : "Baguettes", "code": "baguettes"],
         ["name" : "Bangladeshi", "code": "bangladeshi"],
         ["name" : "Barbeque", "code": "bbq"],
         ["name" : "Basque", "code": "basque"],
         ["name" : "Bavarian", "code": "bavarian"],
         ["name" : "Beer Garden", "code": "beergarden"],
         ["name" : "Beer Hall", "code": "beerhall"],
         ["name" : "Beisl", "code": "beisl"],
         ["name" : "Belgian", "code": "belgian"],
         ["name" : "Bistros", "code": "bistros"],
         ["name" : "Black Sea", "code": "blacksea"],
         ["name" : "Brasseries", "code": "brasseries"],
         ["name" : "Brazilian", "code": "brazilian"],
         ["name" : "Breakfast & Brunch", "code": "breakfast_brunch"],
         ["name" : "British", "code": "british"],
         ["name" : "Buffets", "code": "buffets"],
         ["name" : "Bulgarian", "code": "bulgarian"],
         ["name" : "Burgers", "code": "burgers"],
         ["name" : "Burmese", "code": "burmese"],
         ["name" : "Cafes", "code": "cafes"],
         ["name" : "Cafeteria", "code": "cafeteria"],
         ["name" : "Cajun/Creole", "code": "cajun"],
         ["name" : "Cambodian", "code": "cambodian"],
         ["name" : "Canadian", "code": "New)"],
         ["name" : "Canteen", "code": "canteen"],
         ["name" : "Caribbean", "code": "caribbean"],
         ["name" : "Catalan", "code": "catalan"],
         ["name" : "Chech", "code": "chech"],
         ["name" : "Cheesesteaks", "code": "cheesesteaks"],
         ["name" : "Chicken Shop", "code": "chickenshop"],
         ["name" : "Chicken Wings", "code": "chicken_wings"],
         ["name" : "Chilean", "code": "chilean"],
         ["name" : "Chinese", "code": "chinese"],
         ["name" : "Comfort Food", "code": "comfortfood"],
         ["name" : "Corsican", "code": "corsican"],
         ["name" : "Creperies", "code": "creperies"],
         ["name" : "Cuban", "code": "cuban"],
         ["name" : "Curry Sausage", "code": "currysausage"],
         ["name" : "Cypriot", "code": "cypriot"],
         ["name" : "Czech", "code": "czech"],
         ["name" : "Czech/Slovakian", "code": "czechslovakian"],
         ["name" : "Danish", "code": "danish"],
         ["name" : "Delis", "code": "delis"],
         ["name" : "Diners", "code": "diners"],
         ["name" : "Dumplings", "code": "dumplings"],
         ["name" : "Eastern European", "code": "eastern_european"],
         ["name" : "Ethiopian", "code": "ethiopian"],
         ["name" : "Fast Food", "code": "hotdogs"],
         ["name" : "Filipino", "code": "filipino"],
         ["name" : "Fish & Chips", "code": "fishnchips"],
         ["name" : "Fondue", "code": "fondue"],
         ["name" : "Food Court", "code": "food_court"],
         ["name" : "Food Stands", "code": "foodstands"],
         ["name" : "French", "code": "french"],
         ["name" : "French Southwest", "code": "sud_ouest"],
         ["name" : "Galician", "code": "galician"],
         ["name" : "Gastropubs", "code": "gastropubs"],
         ["name" : "Georgian", "code": "georgian"],
         ["name" : "German", "code": "german"],
         ["name" : "Giblets", "code": "giblets"],
         ["name" : "Gluten-Free", "code": "gluten_free"],
         ["name" : "Greek", "code": "greek"],
         ["name" : "Halal", "code": "halal"],
         ["name" : "Hawaiian", "code": "hawaiian"],
         ["name" : "Heuriger", "code": "heuriger"],
         ["name" : "Himalayan/Nepalese", "code": "himalayan"],
         ["name" : "Hong Kong Style Cafe", "code": "hkcafe"],
         ["name" : "Hot Dogs", "code": "hotdog"],
         ["name" : "Hot Pot", "code": "hotpot"],
         ["name" : "Hungarian", "code": "hungarian"],
         ["name" : "Iberian", "code": "iberian"],
         ["name" : "Indian", "code": "indpak"],
         ["name" : "Indonesian", "code": "indonesian"],
         ["name" : "International", "code": "international"],
         ["name" : "Irish", "code": "irish"],
         ["name" : "Island Pub", "code": "island_pub"],
         ["name" : "Israeli", "code": "israeli"],
         ["name" : "Italian", "code": "italian"],
         ["name" : "Japanese", "code": "japanese"],
         ["name" : "Jewish", "code": "jewish"],
         ["name" : "Kebab", "code": "kebab"],
         ["name" : "Korean", "code": "korean"],
         ["name" : "Kosher", "code": "kosher"],
         ["name" : "Kurdish", "code": "kurdish"],
         ["name" : "Laos", "code": "laos"],
         ["name" : "Laotian", "code": "laotian"],
         ["name" : "Latin American", "code": "latin"],
         ["name" : "Live/Raw Food", "code": "raw_food"],
         ["name" : "Lyonnais", "code": "lyonnais"],
         ["name" : "Malaysian", "code": "malaysian"],
         ["name" : "Meatballs", "code": "meatballs"],
         ["name" : "Mediterranean", "code": "mediterranean"],
         ["name" : "Mexican", "code": "mexican"],
         ["name" : "Middle Eastern", "code": "mideastern"],
         ["name" : "Milk Bars", "code": "milkbars"],
         ["name" : "Modern Australian", "code": "modern_australian"],
         ["name" : "Modern European", "code": "modern_european"],
         ["name" : "Mongolian", "code": "mongolian"],
         ["name" : "Moroccan", "code": "moroccan"],
         ["name" : "New Zealand", "code": "newzealand"],
         ["name" : "Night Food", "code": "nightfood"],
         ["name" : "Norcinerie", "code": "norcinerie"],
         ["name" : "Open Sandwiches", "code": "opensandwiches"],
         ["name" : "Oriental", "code": "oriental"],
         ["name" : "Pakistani", "code": "pakistani"],
         ["name" : "Parent Cafes", "code": "eltern_cafes"],
         ["name" : "Parma", "code": "parma"],
         ["name" : "Persian/Iranian", "code": "persian"],
         ["name" : "Peruvian", "code": "peruvian"],
         ["name" : "Pita", "code": "pita"],
         ["name" : "Pizza", "code": "pizza"],
         ["name" : "Polish", "code": "polish"],
         ["name" : "Portuguese", "code": "portuguese"],
         ["name" : "Potatoes", "code": "potatoes"],
         ["name" : "Poutineries", "code": "poutineries"],
         ["name" : "Pub Food", "code": "pubfood"],
         ["name" : "Rice", "code": "riceshop"],
         ["name" : "Romanian", "code": "romanian"],
         ["name" : "Rotisserie Chicken", "code": "rotisserie_chicken"],
         ["name" : "Rumanian", "code": "rumanian"],
         ["name" : "Russian", "code": "russian"],
         ["name" : "Salad", "code": "salad"],
         ["name" : "Sandwiches", "code": "sandwiches"],
         ["name" : "Scandinavian", "code": "scandinavian"],
         ["name" : "Scottish", "code": "scottish"],
         ["name" : "Seafood", "code": "seafood"],
         ["name" : "Serbo Croatian", "code": "serbocroatian"],
         ["name" : "Signature Cuisine", "code": "signature_cuisine"],
         ["name" : "Singaporean", "code": "singaporean"],
         ["name" : "Slovakian", "code": "slovakian"],
         ["name" : "Soul Food", "code": "soulfood"],
         ["name" : "Soup", "code": "soup"],
         ["name" : "Southern", "code": "southern"],
         ["name" : "Spanish", "code": "spanish"],
         ["name" : "Steakhouses", "code": "steak"],
         ["name" : "Sushi Bars", "code": "sushi"],
         ["name" : "Swabian", "code": "swabian"],
         ["name" : "Swedish", "code": "swedish"],
         ["name" : "Swiss Food", "code": "swissfood"],
         ["name" : "Tabernas", "code": "tabernas"],
         ["name" : "Taiwanese", "code": "taiwanese"],
         ["name" : "Tapas Bars", "code": "tapas"],
         ["name" : "Tapas/Small Plates", "code": "tapasmallplates"],
         ["name" : "Tex-Mex", "code": "tex-mex"],
         ["name" : "Thai", "code": "thai"],
         ["name" : "Traditional Norwegian", "code": "norwegian"],
         ["name" : "Traditional Swedish", "code": "traditional_swedish"],
         ["name" : "Trattorie", "code": "trattorie"],
         ["name" : "Turkish", "code": "turkish"],
         ["name" : "Ukrainian", "code": "ukrainian"],
         ["name" : "Uzbek", "code": "uzbek"],
         ["name" : "Vegan", "code": "vegan"],
         ["name" : "Vegetarian", "code": "vegetarian"],
         ["name" : "Venison", "code": "venison"],
         ["name" : "Vietnamese", "code": "vietnamese"],
         ["name" : "Wok", "code": "wok"],
         ["name" : "Wraps", "code": "wraps"],
         ["name" : "Yugoslav", "code": "yugoslav"]]
    var switchStates = [Int: Bool]()
    
    let Distances: [[String: String]] =
        [["display" : "0.3 km", "value": "3"],
         ["display" : "1 km", "value": "10"],
         ["display" : "5 km", "value": "50"],
         ["display" : "10 km", "value": "100"]
         ]

    let SortModes: [[String: String]] =
        [["display" : "Best Matched", "value" : "\(YelpSortMode.bestMatched.rawValue)"],
         ["display" : "Distance", "value" : "\(YelpSortMode.distance.rawValue)"],
         ["display" : "Highest Rated", "value" : "\(YelpSortMode.highestRated.rawValue)"]
    ]
    
    var delegate: FiltersViewControllerDelegate!
    var hasDealFilter = false
    var selectedDistance = ""
    var selectedSortMode = ""
    var lastSelectedDistanceIP: IndexPath?
    var lastSelectedSortIP: IndexPath?
    var cruisinePreferred = [String]()
    
    override func viewDidLoad() {
        super.viewDidLoad()

        tableView.delegate = self
        tableView.dataSource = self
        
        tableView.estimatedRowHeight = 100
        tableView.rowHeight = UITableViewAutomaticDimension
        
        let setting = UserDefaults.standard
        hasDealFilter = (setting.value(forKey: "HAS_OFFER") as? Bool) ?? false
        selectedSortMode = setting.value(forKey: "SORT_MODE") as! String
        selectedDistance = setting.value(forKey: "IN_DISTANCE") as! String
        cruisinePreferred = (setting.value(forKey: "CRUISINE_PREFERRED") as! NSArray) as! [String]
        
        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    @IBAction func onCancel(_ sender: UIBarButtonItem) {
        dismiss(animated: true, completion: nil)
    }
    
    @IBAction func onSave(_ sender: UIBarButtonItem) {
        var filters = [String]()
//        for(row, isSelected) in switchStates{
//            if isSelected {
//                filters.append(categories[row]["code"]!)
//            }
//        }
        filters = cruisinePreferred
//        print(filters)
//        if filters.count > 0
//        {
        let sortSelect = Int(selectedSortMode) ?? 0
        let sortMode = YelpSortMode(rawValue: sortSelect)
        
            delegate.filtersViewController(filterVC: self, didUpdateFilter: filters, sortmode: sortMode! , hasDeals: hasDealFilter, distance: selectedDistance)
//        }
        dismiss(animated: true, completion: nil)
    }
}

extension FiltersViewController: UITableViewDelegate,UITableViewDataSource, SwitchCellDelegate, SelectCellDelegate{
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        switch (indexPath as NSIndexPath).section {
        case 0:
            let cell = tableView.dequeueReusableCell(withIdentifier: "switchCell") as! SwitchCell
            cell.categoryLabel.text = "Offering a deal"
            cell.switchButton.isOn = hasDealFilter
            cell.setDealCell()
            cell.delegate = self
            return cell
        case 1:
            let cell = tableView.dequeueReusableCell(withIdentifier: "SelectCell") as! SelectCell
            cell.delegate = self
            cell.valueLabel.text = Distances[indexPath.row]["display"]
            if (selectedDistance == Distances[indexPath.row]["value"]){
                cell.accessoryType = .checkmark
                lastSelectedDistanceIP = indexPath
            }
            return cell
        case 2:
            let cell = tableView.dequeueReusableCell(withIdentifier: "SelectCell") as! SelectCell
            cell.delegate = self
            cell.valueLabel.text = SortModes[indexPath.row]["display"]
            if (selectedSortMode == SortModes[indexPath.row]["value"]){
                cell.accessoryType = .checkmark
                lastSelectedSortIP = indexPath
            }
            return cell
        case 3:
            let cell = tableView.dequeueReusableCell(withIdentifier: "switchCell") as! SwitchCell
            
            cell.categoryLabel.text = categories[indexPath.row]["name"]
            let code = categories[indexPath.row]["code"]!
            cell.cruisineCode = code
//            cell.switchButton.isOn = switchStates[indexPath.row] ?? false
            
            if (cruisinePreferred.index(of: code) != nil) {
                cell.switchButton.isOn = true
            } else
            {
                cell.switchButton.isOn = false
            }
            cell.delegate = self
            
            return cell
        default:
            return UITableViewCell()
        }
        
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        switch section {
        case 0: return 1
        case 1: return Distances.count
        case 2: return SortModes.count
        case 3: return categories.count
        default: return 0
        }
        
    }
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 4
    }
    
    func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        switch section {
            case 0 :
                return "Deals"
            case 1:
                return "Distance"
            case 2:
                return "Sort by"
            default:
                return "Category"
        }
    }

    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        if (indexPath as NSIndexPath).section == 1 {
            selectedDistance = Distances[(indexPath as NSIndexPath).row]["value"]!
            print("Selected Distance Fileter \(selectedDistance)")
            
            tableView.deselectRow(at: indexPath, animated: true)
            
            if indexPath.row != lastSelectedDistanceIP?.row {
                if let lastSelectedDistance = lastSelectedDistanceIP {
                    let oldCell = tableView.cellForRow(at: lastSelectedDistance)
                    oldCell?.accessoryType = .none
                }
                
                let newCell = tableView.cellForRow(at: indexPath)
                newCell?.accessoryType = .checkmark
                
                lastSelectedDistanceIP = indexPath
                
                let setting = UserDefaults.standard
                setting.set(selectedDistance, forKey: "IN_DISTANCE")
            }
        }
        else if(indexPath as NSIndexPath).section == 2 {
            selectedSortMode = SortModes[(indexPath as NSIndexPath).row]["value"]!
            print("Selected Sort Mode: \(selectedSortMode)")
            tableView.deselectRow(at: indexPath, animated: true)
            
            if indexPath.row != lastSelectedSortIP?.row {
                if let lastSelectedSort = lastSelectedSortIP {
                    let oldCell = tableView.cellForRow(at: lastSelectedSort)
                    oldCell?.accessoryType = .none
                }
                
                let newCell = tableView.cellForRow(at: indexPath)
                newCell?.accessoryType = .checkmark
                
                lastSelectedSortIP = indexPath
                
                let setting = UserDefaults.standard
                setting.set(selectedSortMode, forKey: "SORT_MODE")
            }
        }

    }
    func switchCell(switchCell: SwitchCell, didChangeValue value: Bool) {
        if(switchCell.isDealCell){
            hasDealFilter = value
            let setting = UserDefaults.standard
            setting.set(value, forKey: "HAS_OFFER")
        }
        else{
            let ip = tableView.indexPath(for: switchCell)
            switchStates[ip!.row] = value
            if(value == true){
                cruisinePreferred.append(switchCell.cruisineCode)
            }
            else {
                let index = cruisinePreferred.index(of: switchCell.cruisineCode)
                if (index! >= 0) {
                    cruisinePreferred.remove(at: index!)
                }
            }
            let setting = UserDefaults.standard
            setting.set(cruisinePreferred, forKey: "CRUISINE_PREFERRED")
        }
    }
    func selectCell(selectCell: SelectCell, isSelected value: Bool) {
//        print("SelectCell is clicked")
        print(selectCell.valueLabel.text ?? "null VALUE")
    }
}
