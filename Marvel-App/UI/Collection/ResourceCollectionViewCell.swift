//
//  PeopleCollectionViewCell.swift
//  NewsFeed
//
//  Created by Carles Grau Galvan on 13/04/2017.
//  Copyright © 2017 Carles Grau Galvan. All rights reserved.
//

import UIKit
import Kingfisher

class ResourceCollectionViewCell: UICollectionViewCell {

    var data: Item! {
        didSet{
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
    
    
    func fillCell(withData data: Item){
        MainScreenWorker().getComicThumbnailData(url: data.resourceURI) { (comicImage, error) in
            guard let comicImage = comicImage, let url = URL(string: comicImage) else { return }
            let resource = ImageResource(downloadURL: url)
            self.thumbnail.kf.indicatorType = .activity
            self.thumbnail.kf.setImage(with: resource)
        }
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
    }
    override func prepareForReuse() {
        self.thumbnail.image = nil
        super.prepareForReuse()
    }
}
