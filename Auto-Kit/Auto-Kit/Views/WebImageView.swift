//
//  WebImageView.swift
//  Auto-Kit
//
//  Created by Сергей Павленок on 01.05.2021.
//  Copyright © 2021 just_terror. All rights reserved.
//

import UIKit

class WebImageView: UIImageView {

    private var currentUrlString: String?

    func set(imageURL: String?) {

        currentUrlString = imageURL

        guard let imageURL = imageURL, let url = URL(string: imageURL) else {
            self.image = nil
            return }

        if let cachedResponse = URLCache.shared.cachedResponse(for: URLRequest(url: url)) {
            self.image = UIImage(data: cachedResponse.data)
            //print("from cachе")
            return
        }

        //print("from internet")
        let dataTask = URLSession.shared.dataTask(with: url) { [weak self] (data, response, _) in

            DispatchQueue.main.async {
                if let data = data, let response = response {
                    self?.handleLoadedImage(data: data, response: response)
                }
            }
        }
        dataTask.resume()
    }

    private func handleLoadedImage(data: Data, response: URLResponse) {
        guard let responseURL = response.url else { return }
        let cachedResponse = CachedURLResponse(response: response, data: data)
        URLCache.shared.storeCachedResponse(cachedResponse, for: URLRequest(url: responseURL))
        if responseURL.absoluteString == currentUrlString {
            self.image = UIImage(data: data)
        }
    }
}
