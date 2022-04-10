//
//  RickAndMortyLeftTableViewCell.swift
//  RickAndMortySwiftWithoutSB
//
//  Created by Arslan Kaan AYDIN on 9.04.2022.
//

import UIKit
import AlamofireImage

class RickAndMortyLeftTableViewCell: UITableViewCell {
    
    private let customImageViewLeftCell: UIImageView = UIImageView()
    private let titleLeftCell: UILabel = UILabel()
    private let customDescriptionLeftCell: UILabel = UILabel()

    
    private let randomImage: String = "https://picsum.photos/200/300"
    
    enum IdentifierLeft: String {
        case custom = "AKA"
    }

    override func awakeFromNib() {
        super.awakeFromNib()
    }
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        configure()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func configure() {
        addLeftSubviews()
        titleLeftCell.font = .boldSystemFont(ofSize: 15)
        customDescriptionLeftCell.font = .italicSystemFont(ofSize: 15)
        
        customImageViewLeftCell.snp.makeConstraints { make in
            make.top.equalTo(contentView)
            make.bottom.equalTo(contentView).offset(-40)
            make.left.equalToSuperview()
            make.right.equalToSuperview()
        }
        
        titleLeftCell.snp.makeConstraints { make in
            make.top.equalTo(customImageViewLeftCell.snp.bottom)
            make.left.right.equalTo(contentView)
        }
        
        customDescriptionLeftCell.snp.makeConstraints { make in
            make.top.equalTo(titleLeftCell.snp.bottom)
            make.left.equalTo(titleLeftCell)
            make.bottom.equalTo(contentView).offset(-5)
        }
        
    }
    
    func saveModelLeft(model: Result) {
        var aliveCount = 0
        if model.status == "Alive"
        {
            aliveCount += 1
            customDescriptionLeftCell.text = model.status
            titleLeftCell.text = model.name
            customImageViewLeftCell.af.setImage(withURL: URL(string:  model.image ?? randomImage) ?? URL(string: randomImage)!)
        }
    }
    
    private func addLeftSubviews(){
        addSubview(customImageViewLeftCell)
        addSubview(titleLeftCell)
        addSubview(customDescriptionLeftCell)
    }
    
}
