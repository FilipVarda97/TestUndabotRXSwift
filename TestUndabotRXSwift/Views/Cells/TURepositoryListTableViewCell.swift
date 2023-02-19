//
//  TURepositoryListTableViewCell.swift
//  TestUndabotRXSwift
//
//  Created by Filip Varda on 19.02.2023..
//

import UIKit

final class TURepositoryListTableViewCell: UITableViewCell {
    static let identifier = "TURepositoryListTableViewCell"

    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
