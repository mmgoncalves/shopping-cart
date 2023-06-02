//
//  HomeViewController.swift
//  ShoppingCart
//
//  Created by Mateus Marques on 01/06/23.
//

import UIKit

protocol HomeDisplayLogic: AnyObject {
    func show(_ products: [Product])
}

final class HomeViewController: UIViewController {
    
    // MARK: - Properties
    private lazy var scrollView: UIScrollView = {
        let scroll = UIScrollView()
        scroll.translatesAutoresizingMaskIntoConstraints = false
        return scroll
    }()
    
    private lazy var contentView: UIView = {
        let container = UIView()
        container.translatesAutoresizingMaskIntoConstraints = false
        return container
    }()
    
    private lazy var titleLabel: UILabel = {
        let label = UILabel()
        label.text = "Escolha os seus produtos"
        label.font = .defaultFont(44)
        label.textColor = .darkGray
        label.numberOfLines = 0
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    private lazy var promotionFilterLabel: UILabel = {
        let label = UILabel()
        label.text = "Em promoção"
        label.font = .defaultFont()
        label.textColor = .darkGray
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    private lazy var promotionFilterSwitch: UISwitch = {
        let promotionFilter = UISwitch(frame: .zero)
        promotionFilter.addTarget(self, action: #selector(promotionSwitchDidChange), for: .touchUpInside)
        promotionFilter.translatesAutoresizingMaskIntoConstraints = false
        return promotionFilter
    }()
    
    private lazy var collectionView: UICollectionView = {
        let flowLayout = UICollectionViewFlowLayout()
        flowLayout.scrollDirection = .vertical
        flowLayout.sectionInset = .init(top: 0, left: 20, bottom: 0, right: 20)
        flowLayout.itemSize = CGSize(width: 160, height: 300)
        let collection = UICollectionView(frame: .zero, collectionViewLayout: flowLayout)
        collection.translatesAutoresizingMaskIntoConstraints = false
        return collection
    }()
    
    private lazy var payButton: UIButton = {
        let button = UIButton()
        button.backgroundColor = .systemGreen
        let title = NSAttributedString(
            string: "Pagar",
            attributes: [
                NSAttributedString.Key.font: UIFont.defaultFont(18)
            ]
        )
        button.setAttributedTitle(title, for: .normal)
        button.setTitleColor(.white, for: .normal)
        button.layer.cornerRadius = 8
        button.addTarget(self, action: #selector(payButtonDidTap), for: .touchUpInside)
        button.translatesAutoresizingMaskIntoConstraints = false
        return button
    }()

    private var productList: [Product] = []
    
    var router: HomeRoutingLogic?
    var interactor: HomeBusinessLogic?
    
    init() {
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func loadView() {
        super.loadView()
        setupView()
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        interactor?.viewDidLoad()
    }
    
    @objc private func promotionSwitchDidChange(_ sender: AnyObject) {
        print("switch => ", promotionFilterSwitch.isOn)
        promotionFilterSwitch.largeContentTitle = "teste large title"
    }
    
    @objc private func payButtonDidTap(_ sender: AnyObject) {
        print("Pay button =>")
    }
}

extension HomeViewController: HomeDisplayLogic {
    func show(_ products: [Product]) {
        productList = products
        collectionView.reloadData()
    }
}

extension HomeViewController: ViewCode {
    func setupViewHierarchy() {
        view.addSubview(scrollView)
        scrollView.addSubview(contentView)
        contentView.addSubview(titleLabel)
        contentView.addSubview(promotionFilterLabel)
        contentView.addSubview(promotionFilterSwitch)
        contentView.addSubview(collectionView)
        contentView.addSubview(payButton)
    }
    
    func setupConstraints() {
        NSLayoutConstraint.activate([
            scrollView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor),
            scrollView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            scrollView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            scrollView.bottomAnchor.constraint(equalTo: view.bottomAnchor),
            
            contentView.topAnchor.constraint(equalTo: scrollView.topAnchor),
            contentView.leadingAnchor.constraint(equalTo: scrollView.leadingAnchor),
            contentView.trailingAnchor.constraint(equalTo: scrollView.trailingAnchor),
            contentView.bottomAnchor.constraint(equalTo: scrollView.bottomAnchor),
            contentView.widthAnchor.constraint(equalTo: scrollView.widthAnchor),
            
            titleLabel.topAnchor.constraint(equalTo: contentView.topAnchor),
            titleLabel.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 22),
            titleLabel.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -22),
            
            promotionFilterLabel.topAnchor.constraint(equalTo: titleLabel.bottomAnchor, constant: 20),
            promotionFilterLabel.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 22),
            
            promotionFilterSwitch.centerYAnchor.constraint(equalTo: promotionFilterLabel.centerYAnchor),
            promotionFilterSwitch.leadingAnchor.constraint(equalTo: promotionFilterLabel.trailingAnchor, constant: 10),
            
            collectionView.topAnchor.constraint(equalTo: promotionFilterLabel.bottomAnchor, constant: 20),
            collectionView.leadingAnchor.constraint(equalTo: contentView.leadingAnchor),
            collectionView.trailingAnchor.constraint(equalTo: contentView.trailingAnchor),
            
            payButton.topAnchor.constraint(equalTo: collectionView.bottomAnchor, constant: 10),
            payButton.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 20),
            payButton.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -20),
            payButton.bottomAnchor.constraint(equalTo: contentView.bottomAnchor, constant: -25),
            payButton.heightAnchor.constraint(equalToConstant: 50)
        ])
        
        let height = contentView.heightAnchor.constraint(equalTo: scrollView.heightAnchor)
        height.priority = .defaultLow
        height.isActive = true
    }
    
    func additionalConfiguration() {
        view.backgroundColor = .white
        
        collectionView.register(
            HomeCollectionViewCell.self,
            forCellWithReuseIdentifier: HomeCollectionViewCell.identifier
        )

        collectionView.dataSource = self
        collectionView.delegate = self
    }
}

extension HomeViewController: UICollectionViewDataSource, UICollectionViewDelegate {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        productList.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let homeCollection = collectionView.dequeueReusableCell(withReuseIdentifier: HomeCollectionViewCell.identifier, for: indexPath) as? HomeCollectionViewCell else {
            let cell = UICollectionViewCell()
            cell.backgroundColor = .blue
            return cell
        }
        
        let product = productList[indexPath.row]
        homeCollection.setupCell(with: product)
        return homeCollection
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        print("Did Select Item")
    }
}
