//
//  DetailViewController.swift
//  MilestoneProject5
//
//  Created by John Nyquist on 4/9/19.
//  Copyright © 2019 Nyquist Art + Logic LLC. All rights reserved.
//

import UIKit

class DetailViewController: UIViewController {
    
    var selectedCountry: Country!
    
    @IBOutlet var imageView: UIImageView!
    @IBOutlet var nameLabel: UILabel!
    @IBOutlet var capitolLabel: UILabel!
    @IBOutlet var sizeLabel: UILabel!
    @IBOutlet var populationLabel: UILabel!
    @IBOutlet var currencyLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        guard let country = selectedCountry else {
            return
        }
        
        nameLabel.text = country.name
        capitolLabel.text = country.capitol
        sizeLabel.text = country.size
        populationLabel.text = String(country.population)
        currencyLabel.text = country.currency
        imageView.image = UIImage(named: country.name.lowercased())
    }
    

}
