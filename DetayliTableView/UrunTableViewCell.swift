//
//  UrunTableViewCell.swift
//  DetayliTableView
//
//  Created by melek türüdi on 27.08.2022.
//

import UIKit
protocol HucreProtocol {
    func buttonTiklandi (indexPath: IndexPath)
}

class UrunTableViewCell: UITableViewCell {

    @IBOutlet weak var UrunFiyatLabel: UILabel!
    @IBOutlet weak var UrunAdLabel: UILabel!
    @IBOutlet weak var UrunImage: UIImageView!
    @IBOutlet weak var HucreArkaplan: UIView!
    
    var hucreProtocol:HucreProtocol?
    var indexPath:IndexPath?
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

    @IBAction func buttonSepeteEkle(_ sender: Any) {
        hucreProtocol?.buttonTiklandi(indexPath: indexPath!)
    }
}
