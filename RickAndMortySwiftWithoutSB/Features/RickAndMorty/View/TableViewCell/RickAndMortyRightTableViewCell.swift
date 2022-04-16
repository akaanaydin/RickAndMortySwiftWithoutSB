//
//  RickAndMortyRightTableViewCell.swift
//  RickAndMortySwiftWithoutSB
//
//  Created by Arslan Kaan AYDIN on 10.04.2022.
//

import UIKit
import AlamofireImage

class RickAndMortyRightTableViewCell: UITableViewCell {
    
    private let customImageViewRightCell: UIImageView = UIImageView()
    private let titleRightCell: UILabel = UILabel()
    private let customDescriptionRightCell: UILabel = UILabel()
    
    private let randomImage: String = "https://picsum.photos/200/300"

    enum IdentifierRight: String {
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
        addRightSubviews()
        titleRightCell.font = .boldSystemFont(ofSize: 15)
        customDescriptionRightCell.font = .italicSystemFont(ofSize: 15)
        
        customImageViewRightCell.snp.makeConstraints { make in
            make.top.equalTo(contentView)
            make.bottom.equalTo(contentView).offset(-40)
            make.left.equalToSuperview()
            make.right.equalToSuperview()
        }
        
        titleRightCell.snp.makeConstraints { make in
            make.top.equalTo(customImageViewRightCell.snp.bottom)
            make.left.equalTo(customImageViewRightCell)
        }
        
        customDescriptionRightCell.snp.makeConstraints { make in
            make.top.equalTo(titleRightCell.snp.bottom)
            make.left.equalTo(titleRightCell)
            make.bottom.equalTo(contentView).offset(-5)
        }
        
        
        
    }
    
    func saveModelRight(model: Result) {
        if  model.status == "Dead"
        {
            customImageViewRightCell.af.setImage(withURL: URL(string:  model.image ?? randomImage) ?? URL(string: randomImage)!)
            titleRightCell.text = model.name
            customDescriptionRightCell.text = model.status
        }
    }
    
    
    
    
    private func addRightSubviews(){
        addSubview(customImageViewRightCell)
        addSubview(titleRightCell)
        addSubview(customDescriptionRightCell)

  
    }

}
