//
//  SkillCell.swift
//  SurfTestTask
//
//  Created by Артем Орлов on 13.02.2023.
//

import UIKit

final class SkillCell: UICollectionViewCell {
    
    static let indetifier = "SkillCell"
    

    
    lazy var nameSkillLabel: UILabel = {
        var label = UILabel()
        label.text = "123"
        label.textColor = .black
        label.textAlignment = .center
        label.clipsToBounds = true
        return label
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        backgroundColor = .lightGray
        addSubview(nameSkillLabel)
        
    }
    override func layoutSubviews() {
        super.layoutSubviews()
        nameSkillLabel.frame = contentView.bounds
        layer.cornerRadius = 10
        selectedBackgroundView?.layer.cornerRadius = 10
    }
    
    func conf(model: String) {
        nameSkillLabel.text = model
    }
    
    override var isSelected: Bool {
        didSet {
            backgroundColor = isSelected ? .black : .lightGray
            nameSkillLabel.textColor = isSelected ? .white : .black
        }
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
