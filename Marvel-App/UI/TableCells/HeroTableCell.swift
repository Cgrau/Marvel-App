//
//  heroTableCell.swift
//  marvel-app
//
//  Created by Carles Grau Galvan on 13/05/2017.
//  Copyright © 2017 Carles Grau Galvan. All rights reserved.
//

import UIKit
import Kingfisher

class HeroTableCell: UITableViewCell {

    @IBOutlet weak var thumbnail: UIImageView!
    @IBOutlet weak var name: UILabel!
    
    var heroData: Character!{
        didSet{
            self.fillCell(withData: heroData)
        }
    }
    
    func fillCell(withData data: Character){
        guard let thumbnail = data.thumbnail else { return }
        guard let url = APIClient.getImageURL(downloadURL: thumbnail.path, extension: thumbnail.thumbnailExtension) else { return }
        let resource = ImageResource(downloadURL: url)
        self.thumbnail.kf.indicatorType = .activity
        (self.thumbnail.kf.indicator?.view as? UIActivityIndicatorView)?.color = .white
        self.thumbnail.kf.indicator?.startAnimatingView()
        self.thumbnail.kf.setImage(with: resource, placeholder: nil, options: nil, progressBlock: nil, completionHandler: { (image, _, _, _) in
            self.thumbnail.kf.indicator?.stopAnimatingView()
        })
        self.name.text = data.name
    }
    
    override func awakeFromNib() {
        super.awakeFromNib()
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
    }
    
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
        
        // Configure the view for the selected state
    }
    
    override func prepareForReuse() {
        self.thumbnail.image = nil
        super.prepareForReuse()
    }
}
