//
//  RickAndMortyViewController.swift
//  RickAndMortySwiftWithoutSB
//
//  Created by Arslan Kaan AYDIN on 9.04.2022.
//

import UIKit
import SnapKit

protocol RickAndMortyOutput {
    func changeLoading(isLoad: Bool)
    func saveDatas(values: [Result])
}

final class RickAndMortyViewController: UIViewController {
    
    private let labelTitle: UILabel = UILabel()
    private let leftTableView: UITableView = UITableView()
    private let rightTableView: UITableView = UITableView()
    private let indicator: UIActivityIndicatorView = UIActivityIndicatorView()

    private lazy var results: [Result] = []
    
    lazy var viewModel: IRickAndMortyViewModel = RickAndMortyViewModel()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        configure()
        viewModel.setDelegate(output: self)
        viewModel.fetchItems()
    }
    
    private func configure() {
        addSubviews()
        drawDesign()
        makeLeftTableView()
        makeRightTableView()
        makeLabel()
        makeIndicator()
    }
    
    private func drawDesign(){
        leftTableView.dataSource = self
        leftTableView.delegate = self
        leftTableView.register(RickAndMortyLeftTableViewCell.self, forCellReuseIdentifier: RickAndMortyLeftTableViewCell.IdentifierLeft.custom.rawValue)
        leftTableView.rowHeight = 250
        rightTableView.dataSource = self
        rightTableView.delegate = self
        rightTableView.register(RickAndMortyRightTableViewCell.self, forCellReuseIdentifier: RickAndMortyRightTableViewCell.IdentifierRight.custom.rawValue)
        rightTableView.rowHeight = 250
        DispatchQueue.main.async {
            self.view.backgroundColor = .white
            self.labelTitle.font = .boldSystemFont(ofSize: 25)
            self.indicator.color = .black
            self.labelTitle.text = "Rick And Morty"
        }
        indicator.startAnimating()
    }
    
    private func addSubviews(){
        view.addSubview(labelTitle)
        view.addSubview(leftTableView)
        view.addSubview(rightTableView)
        view.addSubview(indicator)
    }
    
}

extension RickAndMortyViewController: RickAndMortyOutput{
    func changeLoading(isLoad: Bool) {
        isLoad  ? indicator.startAnimating() : indicator.stopAnimating()
    }
    
    func saveDatas(values: [Result]) {
        results = values
        leftTableView.reloadData()
        rightTableView.reloadData()
    }
}

extension RickAndMortyViewController: UITableViewDataSource, UITableViewDelegate {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        lazy var returnCellCount: Int = 1
        
        if tableView == leftTableView {
            returnCellCount = results.count
        }else if tableView == rightTableView {
            returnCellCount = results.count
        }
        return returnCellCount
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        var returnCell: UITableViewCell = UITableViewCell()
        
        if tableView == leftTableView {
            guard let cell: RickAndMortyLeftTableViewCell = tableView.dequeueReusableCell(withIdentifier: RickAndMortyLeftTableViewCell.IdentifierLeft.custom.rawValue) as? RickAndMortyLeftTableViewCell else {
                return UITableViewCell()
        }
        
        cell.saveModelLeft(model: results[indexPath.row])
        
        returnCell = cell
            
        } else if tableView == rightTableView {
            guard let cell: RickAndMortyRightTableViewCell = tableView.dequeueReusableCell(withIdentifier: RickAndMortyRightTableViewCell.IdentifierRight.custom.rawValue) as? RickAndMortyRightTableViewCell else {
                return UITableViewCell()
            }
            
            cell.saveModelRight(model: results[indexPath.row])
            returnCell = cell
        }
        
        return returnCell
    }
    
}



    
extension RickAndMortyViewController {
        
        private func makeLeftTableView(){
            leftTableView.snp.makeConstraints { make in
                make.top.equalTo(labelTitle.snp.bottom).offset(10)
                make.bottom.equalToSuperview()
                make.left.equalTo(labelTitle)
                make.right.equalTo(-(view.frame.width / 2))
            }
        }
    private func makeRightTableView(){
        rightTableView.snp.makeConstraints { make in
            make.top.equalTo(labelTitle.snp.bottom).offset(10)
            make.bottom.equalToSuperview()
            make.left.equalTo(leftTableView.snp.right).offset(5)
            make.right.equalTo(labelTitle)
        }
    }
        
        private func makeLabel(){
            labelTitle.snp.makeConstraints { make in
                make.top.equalTo(view.safeAreaLayoutGuide.snp.top)
                make.left.equalToSuperview().offset(10)
                make.right.equalToSuperview().offset(-10)
                make.height.greaterThanOrEqualTo(10)
            }
        }
        
        private func makeIndicator(){
            indicator.snp.makeConstraints { make in
                make.height.equalTo(labelTitle)
                make.right.equalTo(labelTitle).offset(-5)
                make.top.equalTo(labelTitle)
            }
        }
        
    }


    




