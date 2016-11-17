

import UIKit

class FunctionCell: BaseCell {
    
    let functionLabel: UILabel = {
        let label = UILabel()
        label.text = "Function Name"
        label.textColor = .black
        label.textAlignment = .center
        label.font = UIFont.systemFont(ofSize: 20)
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    
    override func setupViews() {
        super.setupViews()
        addSubview(functionLabel)
        
        functionLabel.centerXAnchor.constraint(equalTo: centerXAnchor).isActive = true
        functionLabel.centerYAnchor.constraint(equalTo: centerYAnchor).isActive = true
        functionLabel.widthAnchor.constraint(equalTo: widthAnchor).isActive = true
        functionLabel.heightAnchor.constraint(equalTo: heightAnchor).isActive = true
    }
    
    
}
