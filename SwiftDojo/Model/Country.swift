//
//  Country.swift
//  SwiftDojo
//
//  Created by Elton Mendes Vieira Junior on 21/02/2018.
//  Copyright © 2018 Cartrawler. All rights reserved.
//

import UIKit

struct Country: Decodable {
    let countryName: String?
    let id: Int?
    let countryURL: URL?
    let countryDescription : String?
}

struct Countries: Decodable {
    let countries : [Country]
}
