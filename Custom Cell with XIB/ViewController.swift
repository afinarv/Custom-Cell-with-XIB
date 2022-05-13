//
//  ViewController.swift
//  Custom Cell with XIB
//
//  Created by Afina R. Vinci on 10/05/22.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet weak var tableView: UITableView!
    var friendsWishlist: [BirthdayWishlist] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        friendsWishlist = createWishlist()
        setupTableViewCell()
        
    }
    
    func createWishlist() -> [BirthdayWishlist] {
        var wishlist: [BirthdayWishlist] = []
        
        let product0 = Product(productName: "DK Usagi Puff Caramel 60 gram", imageName: "a", price: 6895, priority: true)
        let product1 = Product(productName: "PHILIPS Air Fryer HD9218 Garansi Resmi", imageName: "b", price: 1499000, priority: false)
        let product2 = Product(productName: "Damascus Kitchen Knife Set 3 Piece", imageName: "c", price: 2839197, priority: false)
        let product3 = Product(productName: "Apple AirPods Max - Sky Blue", imageName: "d", price: 6880707, priority: false)
        let friend0wishlist = BirthdayWishlist(personName: "Afina", birthday: "4 June", wishlist: [product0, product1, product2, product3])
        
        let product4 = Product(productName: "Puzzle Pokémon Allstars (5000 Pieces)", imageName: "e", price: 2750000, priority: true)
        let product5 = Product(productName: "Franchise Container Kebab Café by Baba Rafi", imageName: "f", price: 300000000, priority: false)
        let product6 = Product(productName: "Permen Karet Yosan Isi 24 pcs", imageName: "g", price: 9500, priority: false)
        let friend1wishlist = BirthdayWishlist(personName: "Dini", birthday: "24 July", wishlist: [product4, product5, product6])
        
        wishlist = [friend0wishlist, friend1wishlist]
        
        return wishlist
    }

    func setupTableViewCell() {
        tableView.delegate = self
        tableView.dataSource = self
        let nib = UINib(nibName: "CustomCell", bundle: nil)
        tableView.register(nib, forCellReuseIdentifier: "cell")
        let nib2 = UINib(nibName: "CustomExpensiveCell", bundle: nil)
        tableView.register(nib2, forCellReuseIdentifier: "expensiveCell")
    }

}

extension ViewController: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let product = friendsWishlist[indexPath.section].wishlist[indexPath.row]
        if product.price > 3000000 {
            let cell = tableView.dequeueReusableCell(withIdentifier: "expensiveCell") as! CustomExpensiveCell
            cell.setupCell(product)
            return cell
        } else {
            let cell = tableView.dequeueReusableCell(withIdentifier: "cell") as! CustomCell
            cell.setupCell(product)
            return cell
        }
    }
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return friendsWishlist.count
    }
    
    func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        return friendsWishlist[section].personName + " " + friendsWishlist[section].birthday
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        let product = friendsWishlist[indexPath.section].wishlist[indexPath.row]
        if product.price > 3000000 {
            return 200
        } else {
            return 120
        }
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return friendsWishlist[section].wishlist.count
    }
    


}

