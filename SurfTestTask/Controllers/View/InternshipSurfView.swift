//
//  InternshipSurfView.swift
//  SurfTestTask
//
//  Created by Артем Орлов on 13.02.2023.
//

import UIKit

final class InternshipSurfView: UIView {
    
    // MARK: - Model
    
    var skillModel = SwiftSkillModel()
    
    // MARK: - UI Elements
    
    private lazy var mainStackView: UIStackView = {
        let stack = UIStackView()
        stack.axis = .vertical
        stack.spacing = 10
        stack.alignment = .leading
        stack.translatesAutoresizingMaskIntoConstraints = false
        return stack
    }()
    
    private lazy var nameIntershipLabel: UILabel = {
        var label = UILabel()
        label.font = .boldSystemFont(ofSize: 24)
        label.text = "Стажировка в Surf"
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    private lazy var descriptionIntershipLabel: UILabel = {
        var label = UILabel()
        label.text = "Работай над реальными задачами под руководством опытного наставника и получи возможность стать частью команды мечты."
        label.font = .systemFont(ofSize: 14)
        label.numberOfLines = 0
        label.textColor = .lightGray
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    private lazy var skillCollectionView: UICollectionView = {
        let layout = UICollectionViewFlowLayout()
        layout.scrollDirection = .horizontal
        let collection = UICollectionView(frame: .zero, collectionViewLayout: layout)
        collection.register(SkillCell.self, forCellWithReuseIdentifier: SkillCell.indetifier)
        collection.showsHorizontalScrollIndicator = false
        collection.delegate = self
        collection.dataSource = self
        collection.translatesAutoresizingMaskIntoConstraints = false
        return collection
    }()
    
    private lazy var inviteStackView: UIStackView = {
        let stack = UIStackView()
        stack.axis = .horizontal
        stack.alignment = .center
        stack.translatesAutoresizingMaskIntoConstraints = false
        return stack
    }()
    
    private lazy var invitationIntershipLabel: UILabel = {
        var label = UILabel()
        label.text = "Хочешь к нам?"
        label.font = .systemFont(ofSize: 14)
        label.textColor = .lightGray
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    private lazy var submitApplicationButton: UIButton = {
        let button = UIButton()
        button.setTitle("Отправить заявку", for: .normal)
        button.backgroundColor = .black
        button.layer.cornerRadius = 22
        button.addTarget(self, action: #selector(add1), for: .touchUpInside)
        button.translatesAutoresizingMaskIntoConstraints = false
        return button
    }()
    
    @objc func add1(sender: UIButton) {
        alert()
    }
    
    // MARK: - Init
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setup()
        layout()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    // MARK: - Private Methods
    
    private func setup() {
        backgroundColor = .white
        layer.cornerRadius = 30
    }
    
    private func layout() {
        
        skillCollectionView.allowsMultipleSelection = true
        addSubview(mainStackView)
        mainStackView.addArrangedSubview(nameIntershipLabel)
        mainStackView.addArrangedSubview(descriptionIntershipLabel)
        addSubview(skillCollectionView)
        addSubview(inviteStackView)
        inviteStackView.addArrangedSubview(invitationIntershipLabel)
        inviteStackView.addArrangedSubview(submitApplicationButton)
        
        NSLayoutConstraint.activate([
            mainStackView.topAnchor.constraint(equalTo: topAnchor, constant: 20),
            mainStackView.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 20),
            mainStackView.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -10),
            mainStackView.heightAnchor.constraint(equalTo: heightAnchor, multiplier: 0.33),
            
            skillCollectionView.topAnchor.constraint(equalTo: mainStackView.bottomAnchor, constant: 10),
            skillCollectionView.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 20),
            skillCollectionView.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -20),
            skillCollectionView.heightAnchor.constraint(equalTo: heightAnchor, multiplier: 0.23),
            
            submitApplicationButton.widthAnchor.constraint(equalTo: widthAnchor, multiplier: 0.57),
            submitApplicationButton.heightAnchor.constraint(equalTo: heightAnchor, multiplier: 0.17),
            
            inviteStackView.topAnchor.constraint(equalTo: skillCollectionView.bottomAnchor),
            inviteStackView.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 20),
            inviteStackView.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -20),
            inviteStackView.bottomAnchor.constraint(equalTo: bottomAnchor, constant: -20),
        ])
    }
    

}


extension InternshipSurfView:  UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout {
    
    // MARK: - UICollectionViewDataSource
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        skillModel.skills.count * 2
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: SkillCell.indetifier, for: indexPath) as? SkillCell else { return UICollectionViewCell()}
        var index = indexPath.item
        if index > skillModel.skills.count - 1 {
            index -= skillModel.skills.count
        }
        let ab = skillModel.skills[index % skillModel.skills.count]
        cell.nameSkillLabel.text = ab
        return cell
    }
    
    // MARK: - UICollectionViewDelegateFlowLayout
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: skillModel.skills[indexPath.item % skillModel.skills.count].size(withAttributes: [NSAttributedString.Key.font : UIFont.systemFont(ofSize: 17)]).width + 25,  height: 44)
    }
    
    // MARK: - UICollectionViewDelegate
    
    func collectionView(_ collectionView: UICollectionView, willDisplay cell: UICollectionViewCell, forItemAt indexPath: IndexPath) {
        var offset = collectionView.contentOffset
        let width = collectionView.contentSize.width
        if offset.x < width/4 {
            offset.x += width/2
            collectionView.setContentOffset(offset, animated: false)
        } else if offset.x > width/4 * 3 {
            offset.x -= width/2
            collectionView.setContentOffset(offset, animated: false)
        }
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        let indexPath = IndexPath(item: 10, section: 0)
        skillCollectionView.scrollToItem(at: indexPath, at: [.centeredVertically, .centeredHorizontally], animated: true)
    }
}

// MARK: - UIAlertController

extension InternshipSurfView {
    
    func alert() {
        let alert = UIAlertController(title: "Поздравляем!", message: "Ваша заявка успешно отправлена!", preferredStyle: .alert)
        let alertAction = UIAlertAction(title: "Закрыть", style: .default)
        alert.addAction(alertAction)
        window?.rootViewController?.present(alert, animated: true, completion: nil)
    }
}
