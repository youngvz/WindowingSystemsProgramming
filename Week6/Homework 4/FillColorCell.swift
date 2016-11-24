

import UIKit

class FillColorCell: BaseCell {
    
    let shapeLabel: UILabel = {
        let label = UILabel()
        label.text = "Color"
        label.textColor = .black
        label.textAlignment = .center
        label.font = UIFont.systemFont(ofSize: 20)
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    
    override func setupViews() {
        super.setupViews()
        addSubview(shapeLabel)
        
        shapeLabel.centerXAnchor.constraint(equalTo: centerXAnchor).isActive = true
        shapeLabel.centerYAnchor.constraint(equalTo: centerYAnchor).isActive = true
        shapeLabel.widthAnchor.constraint(equalTo: widthAnchor).isActive = true
        shapeLabel.heightAnchor.constraint(equalTo: heightAnchor).isActive = true
    }
    
    
}
