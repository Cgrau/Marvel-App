//
//  HeroeTableCell.swift
//  marvel-app
//
//  Created by Carles Grau Galvan on 13/05/2017.
//  Copyright © 2017 Carles Grau Galvan. All rights reserved.
//

import UIKit
import Kingfisher

class HeroeTableCell: UITableViewCell {

    @IBOutlet weak var thumbnail: UIImageView!
    @IBOutlet weak var name: UILabel!
    
    var heroeData: Character!{
        didSet{
            self.fillCell(withData: heroeData)
        }
    }
    
    func fillCell(withData data: Character){
        guard let path = data.thumbnail?.path else { return }
        guard let url = URL(string: path) else { return }
        let resource = ImageResource.init(downloadURL: url)
        self.thumbnail.kf.indicatorType = .activity
        self.thumbnail.kf.setImage(with: resource)
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
