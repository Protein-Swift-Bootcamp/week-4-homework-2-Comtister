//
//  SVGImageProcessor.swift
//  HomeWork2
//
//  Created by Oguzhan Ozturk on 8.01.2023.
//

import Foundation
import Kingfisher
import SVGKit

public struct SVGImageProcessor : ImageProcessor{
    public var identifier: String = "com.appidentifier.webpprocessor"
        public func process(item: ImageProcessItem, options: KingfisherParsedOptionsInfo) -> KFCrossPlatformImage? {
            switch item {
            case .image(let image):
                return image
            case .data(let data):
                let imsvg = SVGKImage(data: data)
                return imsvg?.uiImage
            }
        }
}
