//
//  ForceTouchViewController
//  CambridgeArt
//
//  Created by saleh on 1/1/18.
//  Copyright © 2018 saleh. All rights reserved.
//

class Photo {
    let text: String
    let image: UIImage
    init(text: String, image: UIImage){
        self.text = text
        self.image = image
    }
}

class ForceTouchViewController: UIViewController {
    
    
    @IBOutlet weak var imagePeek: UIImageView!
    @IBOutlet weak var labelPeek: UILabel!
    @IBOutlet weak var viewPeek: UIView!
    
    var photo: Photo?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        if let photo = photo {
            imagePeek.image = photo.image
            labelPeek.text = photo.text
        } else {
            imagePeek.image = UIImage(named: "me2")
            labelPeek.text = "quT"
        }
        viewPeek.layer.cornerRadius = 5.0
        viewPeek.layer.masksToBounds = true

    }
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    
}
