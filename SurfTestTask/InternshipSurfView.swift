//
//  InternshipSurfView.swift
//  SurfTestTask
//
//  Created by Артем Орлов on 13.02.2023.
//

import UIKit

final class InternshipSurfView: UIView {
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        backgroundColor = .white
        layer.cornerRadius = 30
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
