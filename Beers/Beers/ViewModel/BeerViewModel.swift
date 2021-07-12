//
//  BeerController.swift
//  Beers
//
//  Created by Tatiana Rico on 07/07/21.
//  Copyright © 2021 Tatiana Rico. All rights reserved.
//

import Foundation

class BeerViewModel {
    
    let controller = RequestApi()
    var model: Beer?
    
    func getApi(completion: @escaping (Bool) -> Void){
        controller.requestBeer { [weak self] (beer, success) in
            guard let self = self else { return }
            if success {
                self.model = beer
                completion(true)
            }
        }
    }
    
    func numberOfRow() -> Int {
        return model?.count ?? 0 
    }
    
    func cellForRow(indexPath: IndexPath) -> BeerElement {
        guard let model = self.model else { return BeerElement(id: 0, name: "", tagline: "", firstBrewed: "", welcomeDescription: "", imageURL: "", abv: 0 , ibu: 0, targetFg: 0, targetOg: 0, ebc: 0, srm: 0, ph: 0, attenuationLevel: 0, volume: BoilVolume(value: 0, unit: Unit.init(rawValue: "")), boilVolume: BoilVolume(value: 0, unit: Unit(rawValue: "")), method: Method(mashTemp: [], fermentation: Fermentation(temp: BoilVolume(value: 0, unit: Unit.init(rawValue: ""))), twist: ""), ingredients: Ingredients(malt: [], hops: [], yeast: ""), foodPairing: [""], brewersTips: "", contributedBy: ContributedBy(rawValue: "")) }
        return model[indexPath.row] 
    }
    
}
