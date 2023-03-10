//
//  SkillCell.swift
//  SurfTestTask
//
//  Created by Артем Орлов on 13.02.2023.
//

import UIKit

final class SkillCell: UICollectionViewCell {
    
    static let indetifier = "SkillCell"
    
    // MARK: - UI Elements
    
    lazy var nameSkillLabel: UILabel = {
        var label = UILabel()
        label.textColor = .black
        label.textAlignment = .center
        label.clipsToBounds = true
        return label
    }()
    
    // MARK: - Life cicle
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        addSubview(nameSkillLabel)
        backgroundColor = .lightGray
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        setup()
    }
    
    override var isSelected: Bool {
        didSet {
            backgroundColor = isSelected ? .black : .lightGray
            nameSkillLabel.textColor = isSelected ? .white : .black
        }
    }
    
    // MARK: - Private Methods
    
    private func setup() {
        nameSkillLabel.frame = contentView.bounds
        layer.cornerRadius = 10
        
        selectedBackgroundView?.layer.cornerRadius = 10
    }
}
