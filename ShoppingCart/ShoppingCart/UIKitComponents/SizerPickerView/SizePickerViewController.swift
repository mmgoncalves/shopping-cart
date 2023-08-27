//
//  SizePickerViewController.swift
//  ShoppingCart
//
//  Created by Mateus Marques on 05/06/23.
//

import UIKit

protocol SizePickerDelegate: AnyObject {
    func didSelect(_ size: Size, from product: Product)
}

final class SizePickerViewController: UIViewController {
    // MARK: - Properties
    private lazy var titleLabel: UILabel = {
        let label = UILabel()
        label.font = .defaultFont(24)
        label.textColor = .darkGray
        label.text = "Tamanhos disponíveis:"
        label.textAlignment = .center
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    private lazy var sizePickerView: UIPickerView = {
        let picker = UIPickerView()
        picker.dataSource = self
        picker.delegate = self
        picker.translatesAutoresizingMaskIntoConstraints = false
        return picker
    }()
    
    private lazy var confirmButton: CustomButton = {
        let button = CustomButton(title: "Confirmar")
        button.addTarget(self, action: #selector(confirmButtonDidTap), for: .touchUpInside)
        return button
    }()
    
    private let product: Product
    private weak var delegate: SizePickerDelegate?
    private var sizes: [Size] {
        product.onlyAvailable
    }
    
    init(product: Product, delegate: SizePickerDelegate) {
        self.product = product
        self.delegate = delegate
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupView()
    }
    
    @objc private func confirmButtonDidTap(_ sender: AnyObject) {
        let row = sizePickerView.selectedRow(inComponent: 0)
        let size = sizes[row]
        delegate?.didSelect(size, from: product)
        dismiss(animated: true)
    }
}

extension SizePickerViewController: UIPickerViewDataSource, UIPickerViewDelegate {
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
            1
    }
    
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        sizes.count
    }
    
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        let row = sizes[row]
        return row.size
    }
    
    func pickerView(_ pickerView: UIPickerView, attributedTitleForRow row: Int, forComponent component: Int) -> NSAttributedString? {
        let row = sizes[row]
        return NSAttributedString(string: row.size, attributes: [.foregroundColor : UIColor.darkGray])
    }
}

extension SizePickerViewController: ViewCode {
    func setupViewHierarchy() {
        view.addSubview(titleLabel)
        view.addSubview(sizePickerView)
        view.addSubview(confirmButton)
    }
    
    func setupConstraints() {
        NSLayoutConstraint.activate([
            titleLabel.topAnchor.constraint(equalTo: view.layoutMarginsGuide.topAnchor),
            titleLabel.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 10),
            titleLabel.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -10),
            
            sizePickerView.topAnchor.constraint(equalTo: titleLabel.bottomAnchor, constant: 10),
            sizePickerView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            sizePickerView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            
            confirmButton.topAnchor.constraint(equalTo: sizePickerView.bottomAnchor, constant: 10),
            confirmButton.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 10),
            confirmButton.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -10),
            confirmButton.bottomAnchor.constraint(equalTo: view.layoutMarginsGuide.bottomAnchor, constant: -25),
            confirmButton.heightAnchor.constraint(equalToConstant: 50)
        ])
    }
    
    func additionalConfiguration() {
        view.backgroundColor = .white
    }
}
