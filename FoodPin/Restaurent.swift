//
//  Restaurent.swift
//  FoodPin
//
//  Created by TekUP2 on 24/02/2017.
//  Copyright © 2017 HedhiliMohamed. All rights reserved.
//

import Foundation


class Restaurant {
    var name = ""
    var type = ""
    var location = ""
    var image = ""
    var isVisited = false
    init(name:String, type:String, location:String, image:String,
         isVisited:Bool) {
        self.name = name
        self.type = type
        self.location = location
        self.image = image
        self.isVisited = isVisited}
}
