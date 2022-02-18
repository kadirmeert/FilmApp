//
//  Extensions.swift
//  FilmApp
//
//  Created by MERT on 27.07.2021.
//

import Foundation
import UIKit

extension UIView {

    func dropShadow(cornerRadius: CGFloat) {
       layer.cornerRadius = cornerRadius
       layer.masksToBounds = false
       layer.shadowColor = UIColor.darkGray.cgColor
       layer.shadowOpacity = 0.1
       layer.shadowOffset = CGSize(width: 0, height: 0)
       layer.shadowRadius = 10
   }
    
}

extension String {
    
    func changeDateFormat() -> String {
        let dateFormatterString = DateFormatter()
        dateFormatterString.dateFormat = "yyyy-MM-dd"
        let movieDate = dateFormatterString.date(from: self)
        
        let newDateFormat = DateFormatter()
        newDateFormat.dateFormat = "dd/MM/yyyy"
        return newDateFormat.string(from: movieDate ?? Date())
    }
    
}
