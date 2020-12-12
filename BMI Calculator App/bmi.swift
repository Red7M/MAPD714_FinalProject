//
//  bmi.swift
//  BMI Calculator App
//
//  Created by Reda Mehali on 12/11/20.
//

import UIKit

class bmi {
    var height : String
    var weight: String
    var bmi: String
    var date : Date
    
    init(height: String, weight: String, bmi: String, date: Date) {
        self.height = height
        self.weight = weight
        self.bmi = bmi
        self.date = date
    }
}
