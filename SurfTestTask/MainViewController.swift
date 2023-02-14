//
//  MainViewController.swift
//  SurfTestTask
//
//  Created by Артем Орлов on 13.02.2023.
//

import UIKit

final class MainViewController: UIViewController {
    
    let scrollView = UIScrollView()
    
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
    
    override func viewDidLoad() {
        super.viewDidLoad()
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

import SwiftUI

struct PeopleVCProvider: PreviewProvider {
    static var previews: some View {
        Container().edgesIgnoringSafeArea(.all)
            .previewDevice("iPhone 13 Pro Max")
    }
    
    struct Container: UIViewControllerRepresentable {
        
        let tabBarVC = MainViewController()
        
        func makeUIViewController(context: Context) -> some UIViewController {
            tabBarVC
        }
        
        func updateUIViewController(_ uiViewController: UIViewControllerType, context: Context) {
            
        }
        
    }
}
