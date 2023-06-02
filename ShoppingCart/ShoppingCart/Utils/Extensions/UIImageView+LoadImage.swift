//
//  UIImageView+LoadImage.swift
//  ShoppingCart
//
//  Created by Mateus Marques on 02/06/23.
//

import UIKit

extension UIImageView {
    func loadImage(from imageString: String) {
        guard let url = URL(string: imageString) else {
            return
        }
        var urlRequest = URLRequest(url: url)
        urlRequest.httpMethod = "GET"
        
        Task {
            do {
                let (data, _) = try await URLSession.shared.data(for: urlRequest)
                await MainActor.run {
                    self.image = UIImage(data: data)
                }
            } catch {
                print("Catch => ", error)
            }
        }
    }
}
