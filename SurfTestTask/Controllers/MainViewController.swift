//
//  MainViewController.swift
//  SurfTestTask
//
//  Created by Артем Орлов on 13.02.2023.
//

import UIKit

final class MainViewController: UIViewController {
    
    // MARK: - UI Element
    
    private let mainImage: UIImageView = {
        let image = UIImageView()
        image.image = UIImage(named: "MainImage")
        image.translatesAutoresizingMaskIntoConstraints = false
        image.contentMode = .scaleAspectFit
        return image
    }()
    
    private lazy var internshipView: InternshipSurfView = {
        let view = InternshipSurfView(frame: .zero)
        view.contentMode = .scaleToFill
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    // MARK: - Life Cicle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        layout()
    }
    
    // MARK: - Private Methods
    
    private func layout() {
        view.addSubview(mainImage)
        view.addSubview(internshipView)
        
        NSLayoutConstraint.activate([
            mainImage.topAnchor.constraint(equalTo: view.topAnchor, constant: -225),
            mainImage.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            mainImage.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            mainImage.bottomAnchor.constraint(equalTo: view.bottomAnchor),
            
            internshipView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            internshipView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            internshipView.bottomAnchor.constraint(equalTo: view.bottomAnchor),
            internshipView.heightAnchor.constraint(equalTo: view.heightAnchor, multiplier: 0.38)
        ])
    }
}
