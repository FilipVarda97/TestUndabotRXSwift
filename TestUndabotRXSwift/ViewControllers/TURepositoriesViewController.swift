//
//  TURepositoriesViewController.swift
//  TestUndabotRXSwift
//
//  Created by Filip Varda on 19.02.2023..
//

import UIKit

class TURepositoriesViewController: UIViewController {
    private let repoListView = TURepositoryListView(frame: .zero)

    // MARK: - Implementation
    override func viewDidLoad() {
        super.viewDidLoad()
        title = "Repositories"
        setUpViews()
    }

    private func setUpViews() {
        view.addSubview(repoListView)
        repoListView.snp.makeConstraints { make in
            make.edges.equalTo(view.safeAreaLayoutGuide)
        }
    }
}
