//
//  AppConfig.swift
//  QRReaderApp
//
//  Created by Oleksandr Karpenko on 17.12.2020.
//

import UIKit

let fontSize: CGFloat = 12
let productCellIdentifier = "ProductCell"

let productsKey = "products"
let productsCountKey = "productsCount"
var savedProducts: [ProductModel]? {
    get {
        var products: [ProductModel] = []
        let count = UserDefaults.standard.integer(forKey: productsCountKey)
        for i in 0..<count {
            let imageName = UserDefaults.standard.string(forKey: "\(productsKey)ImageNameId\(i)") ?? ""
            let code = UserDefaults.standard.string(forKey: "\(productsKey)CodeId\(i)")
            products.append(ProductModel(code: code, imageName: imageName))
        }
        return products
    }
    set {
        if let products = newValue {
            for i in 0..<products.count {
                UserDefaults.standard.setValue(products[i].imageName, forKey: "\(productsKey)ImageNameId\(i)")
                UserDefaults.standard.setValue(products[i].code, forKey: "\(productsKey)CodeId\(i)")
            }
            UserDefaults.standard.setValue(products.count, forKey: productsCountKey)
        }
    }
}
