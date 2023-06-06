//
//  ShoppingCartViewController.swift
//  ShoppingCart
//
//  Created by Mateus Marques on 05/06/23.
//

import UIKit

protocol ShoppingCartDisplayLogic: AnyObject {
    func show(_ products: [CartProduct])
    func updateTotal(_ total: String)
}

final class ShoppingCartViewController: UIViewController {
    // MARK: - Properties
    private lazy var collectionView: UICollectionView = {
        let flowLayout = UICollectionViewFlowLayout()
        flowLayout.scrollDirection = .vertical
        flowLayout.minimumLineSpacing = 30
        flowLayout.sectionInset = .init(top: 20, left: 10, bottom: 0, right: 10)
        let width = UIScreen.main.bounds.width - 20
        flowLayout.itemSize = CGSize(width: width, height: 65)
        let collection = UICollectionView(frame: .zero, collectionViewLayout: flowLayout)
        collection.alwaysBounceVertical = true
        collection.backgroundColor = .white
        collection.translatesAutoresizingMaskIntoConstraints = false
        return collection
    }()
    
    private lazy var totalLabel: UILabel = {
        let label = UILabel()
        label.font = .defaultFont(24)
        label.textColor = .darkGray
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    private lazy var payButton: Button = {
        let button = Button(title: "Pagar")
        button.addTarget(self, action: #selector(payButtonDidTap), for: .touchUpInside)
        return button
    }()
    
    private var products: [CartProduct] = []
    
    var router: ShoppingCartRoutingLogic?
    var interactor: ShoppingCartBusinessLogic?
    
    init() {
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func loadView() {
        super.loadView()
        navigationController?.setNavigationBarHidden(false, animated: true)
        navigationController?.navigationBar.isTranslucent = true
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupView()
        interactor?.viewDidLoad()
    }
    
    @objc private func payButtonDidTap(_ send: AnyObject) {
        print("payButtonDidTap")
    }
}

extension ShoppingCartViewController: ShoppingCartDisplayLogic {
    func show(_ products: [CartProduct]) {
        self.products = products
        collectionView.reloadData()
    }
    
    func updateTotal(_ total: String) {
        totalLabel.text = total
    }
}

extension ShoppingCartViewController: ShoppingCartCollectionViewCellDelegate {
    func minusButtonDidTap(from cartProduct: CartProduct) {
        interactor?.minusButtonDidTap(from: cartProduct)
    }
    
    func plusButtonDidTap(from cartProduct: CartProduct) {
        interactor?.plusButtonDidTap(from: cartProduct)
    }
}

extension ShoppingCartViewController: UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        products.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let homeCollection = collectionView.dequeueReusableCell(withReuseIdentifier: ShoppingCartCollectionViewCell.identifier, for: indexPath) as? ShoppingCartCollectionViewCell else {
            let cell = UICollectionViewCell()
            cell.backgroundColor = .blue
            return cell
        }
        
        let product = products[indexPath.row]
        homeCollection.setup(cartProduct: product, delegate: self)
        return homeCollection
    }
}

extension ShoppingCartViewController: ViewCode {
    func setupViewHierarchy() {
        view.addSubview(collectionView)
        view.addSubview(totalLabel)
        view.addSubview(payButton)
    }
    
    func setupConstraints() {
        NSLayoutConstraint.activate([
            collectionView.topAnchor.constraint(equalTo: view.layoutMarginsGuide.topAnchor, constant: 10),
            collectionView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            collectionView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            
            totalLabel.topAnchor.constraint(equalTo: collectionView.bottomAnchor, constant: 10),
            totalLabel.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 25),
            totalLabel.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -20),
            
            payButton.topAnchor.constraint(equalTo: totalLabel.bottomAnchor, constant: 30),
            payButton.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 20),
            payButton.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -20),
            payButton.bottomAnchor.constraint(equalTo: view.layoutMarginsGuide.bottomAnchor, constant: -25)
        ])
    }
    
    func additionalConfiguration() {
        view.backgroundColor = .white
        
        collectionView.register(
            ShoppingCartCollectionViewCell.self,
            forCellWithReuseIdentifier: ShoppingCartCollectionViewCell.identifier
        )

        collectionView.dataSource = self
    }
}
