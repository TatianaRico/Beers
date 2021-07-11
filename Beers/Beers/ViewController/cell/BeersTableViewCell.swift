//
//  BeersTableViewCell.swift
//  Beers
//
//  Created by Tatiana Rico on 07/07/21.
//  Copyright © 2021 Tatiana Rico. All rights reserved.
//

import UIKit
import SDWebImage

class BeersTableViewCell: UITableViewCell {
    
    @IBOutlet weak var beerImage: UIImageView!
    @IBOutlet weak var nameLb: UILabel!
    @IBOutlet weak var contentLb: UILabel!
    
    override func awakeFromNib() {
          super.awakeFromNib()
          // Initialization code
      }
    
    func setupCell(model: BeerElement) {
        nameLb.text = model.name ?? ""
        contentLb.text = String(model.abv ?? 0)
        
        beerImage.sd_setImage(with: URL(string: model.imageURL ?? ""), completed: nil)
        
//        let data = try? Data(contentsOf: URL(string: model.imageURL ?? "")!)
//        beerImage.image = UIImage(data: data!)
        
    }
}
