//
//  ProductViewController.swift
//  QRReaderApp
//
//  Created by Oleksandr Karpenko on 17.12.2020.
//

import UIKit

class ProductViewController: UIViewController {
    
    @IBOutlet weak var productsCollectionView: UICollectionView!
    
    private var foundCode = ""
    private let viewModel = ProductViewModel()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupCollectionView()
    }
    
    @IBAction func cameraButtonPressed(_ sender: Any) {
        let vc = ScannerViewController()
        vc.foundCodeCallback = { [weak self] code in
            self?.foundCode = code
        }
        navigationController?.pushViewController(vc, animated: true)
    }
    
    func setupCollectionView() {
        productsCollectionView.delegate = self
        productsCollectionView.dataSource = self
        productsCollectionView.register(ProductCollectionViewCell.self, forCellWithReuseIdentifier: productCellIdentifier)
        
        viewModel.fetchData { [weak self] in
            self?.productsCollectionView.reloadData()
        }
    }
}

extension ProductViewController: UICollectionViewDataSource, UICollectionViewDelegate {
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        if foundCode.isEmpty { return }
        
        let cell = collectionView.cellForItem(at: indexPath) as! ProductCollectionViewCell
        cell.updateCode(foundCode)
        viewModel.updateItemCode(foundCode, index: indexPath.row)
        foundCode = ""
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return viewModel.products.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: productCellIdentifier, for: indexPath) as! ProductCollectionViewCell
        cell.config(viewModel.products[indexPath.row])
        return cell
    }
}
