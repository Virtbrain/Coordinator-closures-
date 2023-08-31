//
//  CitiesViewController.swift
//  Coordinator(closures)
//
//  Created by Alexey Manankov on 31.08.2023.
//

import UIKit

final class CitiesViewController: UITableViewController {
    
    //MARK : - Output -
    var onCitySelected: ((City) -> Void)?
    
    //MARK: - Private variables -
    private let cities: [City] = [City(name: "Moscow"),
                                  City(name: "Ulyanovsk"),
                                  City(name: "New York"),
                                  City(name: "Tokyo")]

    override func viewDidLoad() {
        view.backgroundColor = .white
        super.viewDidLoad()
    }

    // MARK: - Table view data source

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return cities.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "cell") else {return UITableViewCell()}
        cell.textLabel?.text = cities[indexPath.row].name
        return cell
    }
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        onCitySelected?(cities[indexPath.row])
    }

}
