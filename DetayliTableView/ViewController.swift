//
//  ViewController.swift
//  DetayliTableView
//
//  Created by melek türüdi on 27.08.2022.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var urunlerTableView: UITableView!
     var urunlerListesi = [Urunler] ()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        let u1 = Urunler(urun_id: 1, urun_ad: "Macbook Pro 14 ", urun_resim_ad: "bilgisayar", urun_fiyat: 43999.0)
        let u2 = Urunler(urun_id: 2, urun_ad: "Extoll John Lennon", urun_resim_ad: "gozluk", urun_fiyat: 2999.0)
        let u3 = Urunler(urun_id: 3, urun_ad: "JBL", urun_resim_ad: "kulaklik", urun_fiyat: 43999.0)
        let u4 = Urunler(urun_id: 4, urun_ad: "Yves Saint Laurent ", urun_resim_ad: "parfum", urun_fiyat: 1000.0)
        let u5 = Urunler(urun_id: 5, urun_ad: "Casio X Series", urun_resim_ad: "saat", urun_fiyat: 1799.0)
        let u6 = Urunler(urun_id: 6, urun_ad: "Dyson V8 ", urun_resim_ad: "supurge", urun_fiyat: 8999.0)
        let u7 = Urunler(urun_id: 7, urun_ad: "Iphone 13 pro", urun_resim_ad: "telefon", urun_fiyat: 23999.0)
        
        urunlerListesi.append(u1)
        urunlerListesi.append(u2)
        urunlerListesi.append(u3)
        urunlerListesi.append(u4)
        urunlerListesi.append(u5)
        urunlerListesi.append(u6)
        urunlerListesi.append(u7)
        
        urunlerTableView.delegate = self
        urunlerTableView.dataSource = self
        
        urunlerTableView.separatorColor = UIColor(white: 0.95, alpha: 1)
        
    }

}
extension ViewController: UITableViewDelegate, UITableViewDataSource, HucreProtocol{
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return urunlerListesi.count
    }
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let urun = urunlerListesi[indexPath.row]
        let cell = tableView.dequeueReusableCell(withIdentifier: "urunHucre", for: indexPath) as! UrunTableViewCell
        cell.UrunImage.image = UIImage(named: urun.urun_resim_ad!)
        cell.UrunAdLabel.text = urun.urun_ad
        cell.UrunFiyatLabel.text = "\(urun.urun_fiyat!) tl "
        
        cell.backgroundColor = UIColor(white:  0.95 , alpha: 1)
        cell.HucreArkaplan.layer.cornerRadius = 10.0
        
        cell.selectionStyle = .none //seçimi kaldırıyor
        
        cell.hucreProtocol = self
        cell.indexPath = indexPath
        
        return cell
    }
    func tableView(_ tableView: UITableView, trailingSwipeActionsConfigurationForRowAt indexPath: IndexPath) -> UISwipeActionsConfiguration? {
        let urun = urunlerListesi[indexPath.row]
        
        let silAction = UIContextualAction(style: .destructive, title: "SİL"){ (ca,v,b) in print("\(urun.urun_ad!) silindi")
        }
        
       let duzenleAction = UIContextualAction(style: .normal, title: "Düzenle"){ (ca,v,b) in print("\(urun.urun_ad!) düzenlendi")
           
        }
            return UISwipeActionsConfiguration(actions: [silAction,duzenleAction])
    }
    func buttonTiklandi(indexPath: IndexPath) {
        let urun = urunlerListesi[indexPath.row]
        print(" \(urun.urun_ad!) sepete eklendi.")
    }
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let urun = urunlerListesi[indexPath.row]
        performSegue(withIdentifier: "toDetay", sender: urun)
    }
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "toDetay"{
            if let urun = sender as? Urunler {
                let gidilecekVC = segue.destination as! DetayVC
                gidilecekVC.urun = urun
            }
        }
        
    }
}

