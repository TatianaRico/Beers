//
//  BeerDetailViewController.swift
//  Beers
//
//  Created by Tatiana Rico on 04/07/21.
//  Copyright © 2021 Tatiana Rico. All rights reserved.
//

import UIKit
import SDWebImage

class BeerDetailViewController: UIViewController {

    @IBOutlet weak var beerImage: UIImageView!
    @IBOutlet weak var nameLb: UILabel!
    @IBOutlet weak var taglineLb: UILabel!
    @IBOutlet weak var contentLb: UILabel!
    @IBOutlet weak var bitterScaleLb: UILabel!
    @IBOutlet weak var descriptionLb: UILabel!
    
    var model: BeerElement?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupDetail()
    }
    

    func setupDetail() {
        nameLb.text = model?.name
        taglineLb.text = model?.tagline
        contentLb.text = String(model?.abv ?? 0)
        bitterScaleLb.text = String(model?.ibu ?? 0)
        descriptionLb.text = model?.welcomeDescription
        beerImage.sd_setImage(with: URL(string: model?.imageURL ?? ""), completed: nil)
    }

}
