//
//  ViewController.swift
//  SwiftDojo
//
//  Created by Elton Mendes Vieira Junior on 19/02/2018.
//  Copyright © 2018 Cartrawler. All rights reserved.
//  https://app.apiary.io/countryapi1/editor

/*
 Dojo - Swift Countries List
 1 - Create the contries list layout, inside main.storyboard. (Required = Use Table View and Cells)
 2 - Create the request, as soon the view is loade to retrieve the countries list . (Required = Request in background thread and response consume on UI Thread)
 3 - Create the model, that will represente the country
 4 - Parse the json into the model object (Decodable protocol)
 4 - Populate the table view with the country list object
 6 - Make your feature to conform with an architecture pattern (MVC , MVVM , VIPER , REDUX )
 7 - Refinments
 */


struct URLConstants {
    static let countryURL = "https://private-bd1c3-countryapi1.apiary-mock.com/countries"
}

import UIKit

class CountriesListView: UIViewController , UITableViewDelegate , UITableViewDataSource{
    
    @IBOutlet weak var tableView: UITableView!
    let session = URLSession(configuration: .default)
    var countries : Countries?
    
    override func viewDidLoad() {
        super.viewDidLoad()
       fetchCountries()
    }
    
    func fetchCountries() {
        let countryURL = URL(string: URLConstants.countryURL)
        let urlRequest = URLRequest(url: countryURL!)
        let dataTask = session.dataTask(with: urlRequest) {
            (data, response, error) in
            guard error == nil else {
                print("error" + (error?.localizedDescription)!)
                return
            }
            if let data = data {
                do {
                    self.countries = try JSONDecoder().decode(Countries.self, from: data)
                    self.updateTable()
                } catch let error as NSError {
                    print(error.localizedDescription)
                }
            }
        }
        dataTask.resume()
    }
    
    func updateTable() {
        DispatchQueue.main.async {
            self.tableView.reloadData()
        }
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        if let number = countries?.countries.count {
            return number
        }
        return 0
    }
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell") as! CountryTableViewCell
        let country = countries?.countries[indexPath.row]
        cell.setupCellWithModel(model: country!)
        return cell
    }
}





