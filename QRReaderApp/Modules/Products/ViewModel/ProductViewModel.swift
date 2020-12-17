//
//  ProductViewModel.swift
//  QRReaderApp
//
//  Created by Oleksandr Karpenko on 17.12.2020.
//

import UIKit

class ProductViewModel {
    
    var products: [ProductModel] = []
    
    func fetchData(_ completion: (() -> ())?) {
        if let savedProducts = savedProducts, savedProducts.count != 0 {
            products = savedProducts
        } else {
            products.append(ProductModel(code: "12341", imageName: "1"))
            products.append(ProductModel(code: nil, imageName: "2"))
            products.append(ProductModel(code: "12343", imageName: "3"))
            products.append(ProductModel(code: "12344", imageName: "4"))
            products.append(ProductModel(code: "12345", imageName: "5"))
            products.append(ProductModel(code: "12346", imageName: "6"))
            products.append(ProductModel(code: nil, imageName: "7"))
            products.append(ProductModel(code: "12348", imageName: "8"))
            products.append(ProductModel(code: "12349", imageName: "9"))
            products.append(ProductModel(code: nil, imageName: "10"))
            products.append(ProductModel(code: "123411", imageName: "11"))
            products.append(ProductModel(code: "123412", imageName: "12"))
            
            savedProducts = products
        }
        
        completion?()
    }
    
    func updateItemCode(_ code: String, index: Int) {
        products[index].code = code
        savedProducts = products
    }
}
