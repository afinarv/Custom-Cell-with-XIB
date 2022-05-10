//
//  CustomCell.swift
//  Custom Cell with XIB
//
//  Created by Afina R. Vinci on 10/05/22.
//

import UIKit

class CustomCell: UITableViewCell {
    @IBOutlet weak var productImageView: UIImageView!
    @IBOutlet weak var productName: UILabel!
    @IBOutlet weak var productPrice: UILabel!
    @IBOutlet weak var starLabel: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        productImageView.layer.borderColor = UIColor.gray.cgColor
        productImageView.layer.borderWidth = 1
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    func setupCell(_ product: Product) {
        productImageView.image = UIImage(named: product.imageName)
        productName.text = product.productName
        productPrice.text = product.price.makeRupiah()
        starLabel.isHidden = !product.priority
    }
    
    
}

extension Int {
    public func makeRupiah() -> String {
        let formatter = NumberFormatter()
        formatter.positivePrefix = "Rp "
        formatter.numberStyle = .currency
        formatter.locale = Locale(identifier: "id_ID")
        let numberValue = NSNumber(value: self)
        return formatter.string(from: numberValue)!
    }
    
    public func splitThousands() -> String {
        let formatter = NumberFormatter()
        formatter.numberStyle = .decimal
        formatter.locale = Locale(identifier: "id_ID")
        let numberValue = NSNumber(value: self)
        return formatter.string(from: numberValue)!
    }
}

struct Product {
    var productName: String
    var imageName: String
    var price: Int
    var priority: Bool
}

struct BirthdayWishlist {
    var personName: String
    var birthday: String
    var wishlist: [Product]
}
