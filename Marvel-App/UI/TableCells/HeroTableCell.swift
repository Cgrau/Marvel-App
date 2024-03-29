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

    var heroData: Character! {
        didSet {
            self.fillCell(withData: heroData)
        }
    }

    func fillCell(withData data: Character) {
        guard let thumbnail = data.thumbnail else { return }
        guard let url = APIClient.getImageURL(downloadURL: thumbnail.path, extension: thumbnail.thumbnailExtension) else { return }
        let resource = KF.ImageResource(downloadURL: url)
        self.thumbnail.setImage(with: resource, activateLoader: true)
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
        thumbnail.kf.cancelDownloadTask()
        self.thumbnail.image = nil
        super.prepareForReuse()
    }
}
