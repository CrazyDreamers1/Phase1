//
//  UIImageView+Extension.swift
//  1st phase
//
//  Created by SOL MAC 15 on 9/5/21.
//

import UIKit

extension UIImageView{
    func load(url: URL) {
        DispatchQueue.global().async { [weak self] in
            if let data = try? Data(contentsOf: url) {
                if let image = UIImage(data: data) {
                    DispatchQueue.main.async {
                        self?.image = image
                    }
                }
            }
        }
    }
}
