//
//  UIViewExtension.swift
//  TestUndabotRXSwift
//
//  Created by Filip Varda on 19.02.2023..
//

import UIKit

extension UIView {
    func addSubviews(_ views: UIView...) {
        views.forEach {
            addSubview($0)
        }
    }
}
