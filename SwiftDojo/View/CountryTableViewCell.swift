//
//  CountryTableViewCell.swift
//  SwiftDojo
//
//  Created by Elton Mendes Vieira Junior on 22/02/2018.
//  Copyright © 2018 Cartrawler. All rights reserved.
//

import UIKit

class CountryTableViewCell: UITableViewCell {

    @IBOutlet weak var countryImageView: UIImageView!
    @IBOutlet weak var countryDescription: UILabel!
    @IBOutlet weak var countryLabel: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    func setupCellWithModel(model : Country) {
        countryLabel.text = model.countryName
        countryDescription.text = model.countryDescription
        
        DispatchQueue.global().async {
            let data = try? Data(contentsOf: model.countryURL!)
            DispatchQueue.main.async {
                self.countryImageView.image = UIImage(data: data!)
            }
        }
        
    }

}
