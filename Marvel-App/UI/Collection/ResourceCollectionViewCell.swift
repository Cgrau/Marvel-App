//
//  ResourceCollectionViewCell.swift
//  Marvel-App
//
//  Created by Carles Grau Galvan on 12/05/2018.
//  Copyright © 2018 Carles Grau Galvan. All rights reserved.
//

import UIKit
import Kingfisher

class ResourceCollectionViewCell: UICollectionViewCell {

    var data: Item! {
        didSet {
            self.fillCell(withData: data)
        }
    }

    @IBOutlet weak var thumbnail: UIImageView!

    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override init(frame: CGRect) {
        super.init(frame: frame)
    }

    func fillCell(withData data: Item) {
        MainScreenWorker().getComicThumbnailData(url: data.resourceURI) { (comicImage, _) in
            guard let comicImage = comicImage, let url = URL(string: comicImage) else { return }
            let resource = ImageResource(downloadURL: url)
            self.thumbnail.setImage(with: resource, activateLoader: true)
        }
    }

    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
    }
    override func prepareForReuse() {
        thumbnail.kf.cancelDownloadTask()
        self.thumbnail.image = nil
        super.prepareForReuse()
    }
}
