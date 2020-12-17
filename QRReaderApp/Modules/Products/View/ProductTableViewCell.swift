//
//  ProductTableViewCell.swift
//  QRReaderApp
//
//  Created by Oleksandr Karpenko on 17.12.2020.
//

import UIKit

class ProductCollectionViewCell: UICollectionViewCell {
    
    private let padding: CGFloat = 10
    
    private lazy var backgroundShadow: UIView = {
        let view = UIView()
        view.backgroundColor = .none
        view.layer.shadowColor = UIColor.black.cgColor
        view.layer.shadowOpacity = 0.1
        view.layer.shadowRadius = 3
        view.layer.cornerRadius = 15
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    private let productImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.contentMode = .scaleAspectFit
        imageView.translatesAutoresizingMaskIntoConstraints = false
        return imageView
    }()
    
    private let codeLabel: UILabel = {
        let label = UILabel()
        label.textAlignment = .center
        label.font = .systemFont(ofSize: fontSize)
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupUI()
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
        setupUI()
    }
    
    func setupUI() {
        addSubview(backgroundShadow)
        addSubview(productImageView)
        addSubview(codeLabel)
        
        NSLayoutConstraint.activate([
            backgroundShadow.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 3),
            backgroundShadow.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -3),
            backgroundShadow.topAnchor.constraint(equalTo: topAnchor, constant: 3),
            backgroundShadow.bottomAnchor.constraint(equalTo: bottomAnchor, constant: -3),
            
            productImageView.leadingAnchor.constraint(equalTo: leadingAnchor, constant: padding),
            productImageView.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -padding),
            productImageView.topAnchor.constraint(equalTo: topAnchor, constant: padding),
            productImageView.heightAnchor.constraint(equalToConstant: 80),
            
            codeLabel.leadingAnchor.constraint(equalTo: leadingAnchor, constant: padding),
            codeLabel.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -padding),
            codeLabel.topAnchor.constraint(equalTo: productImageView.bottomAnchor, constant: 10)
        ])
        
        layer.cornerRadius = 15
    }
    
    func config(_ product: ProductModel) {
        if let image = UIImage(named: product.imageName) {
            productImageView.image = image
        }
        codeLabel.text = product.code ?? "-"
    }
    
    func updateCode(_ code: String) {
        codeLabel.text = code
    }
}
