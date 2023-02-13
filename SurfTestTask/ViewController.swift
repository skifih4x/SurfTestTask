//
//  ViewController.swift
//  SurfTestTask
//
//  Created by Артем Орлов on 13.02.2023.
//

import UIKit

final class ViewController: UIViewController {
    
    let mainImage: UIImageView = {
        let image = UIImageView()
        image.image = UIImage(named: "MainImage")
        image.translatesAutoresizingMaskIntoConstraints = false
        image.contentMode = .scaleToFill
        return image
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.addSubview(mainImage)
        view.backgroundColor = .red
        NSLayoutConstraint.activate([
            mainImage.topAnchor.constraint(equalTo: view.topAnchor),
            mainImage.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            mainImage.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            mainImage.bottomAnchor.constraint(equalTo: view.bottomAnchor)
        ])
    }
}

