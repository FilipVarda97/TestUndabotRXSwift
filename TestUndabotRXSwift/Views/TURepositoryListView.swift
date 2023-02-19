//
//  TURepositoryListView.swift
//  TestUndabotRXSwift
//
//  Created by Filip Varda on 19.02.2023..
//

import UIKit
import SnapKit
import RxSwift
import RxCocoa

final class TURepositoryListView: UIView {
    private let viewModel = TURepositroyListViewViewModel()
    private let bag = DisposeBag()

    private let tableView: UITableView = {
        let table = UITableView()
        table.register(TURepositoryListTableViewCell.self,
                       forCellReuseIdentifier: TURepositoryListTableViewCell.identifier)
        table.separatorStyle = .none
        return table
    }()

    // MARK: - Init
    override init(frame: CGRect) {
        super.init(frame: frame)
        setUpViews()
        setUpConstraints()
        bindTableView()
    }

    required init?(coder: NSCoder) {
        fatalError("Unsupported")
    }

    // MARK: - Implementation
    private func setUpViews() {
        addSubview(tableView)
    }

    private func setUpConstraints() {
        tableView.snp.makeConstraints { make in
            make.edges.equalToSuperview()
        }
    }

    // MARK: RxSwift stuff
    private func bindTableView() {
        /// Bind repositories to tableView
        viewModel.repositories.bind(
            to: tableView.rx.items(
                cellIdentifier: TURepositoryListTableViewCell.identifier,
                cellType: TURepositoryListTableViewCell.self))
        { row, model, cell in
            cell.textLabel?.text = "Name: \(model.name)"
        }.disposed(by: bag)

        /// Bind model selected handler
        tableView.rx.modelSelected(TURepository.self).bind { repo in
            print("Open this repo: \(repo.name)")
        }.disposed(by: bag)
        viewModel.fetchRepositories()
    }
}
