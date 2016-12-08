

import UIKit

class MenuLauncher: NSObject, UICollectionViewDataSource, UICollectionViewDelegate, UICollectionViewDelegateFlowLayout {
    
    let blackView = UIView()
    
    var viewcontroller = ViewController()
    
    let cellId = "cellId"
    let cellHeight: CGFloat = 50
    let iconOptions = ["start" , "restart", "pause", "exit", "cancel"]
    let options = ["Start", "Reset", "Pause", "Exit", ""]
    
    let collectionView: UICollectionView = {
        let layout = UICollectionViewFlowLayout()
        let cv = UICollectionView(frame: .zero, collectionViewLayout: layout)
        cv.backgroundColor = UIColor.white
        return cv
    }()
    
    func showSettings() {
        //show menu
        
        if let window = UIApplication.shared.keyWindow {
            
            blackView.backgroundColor = UIColor(white: 0, alpha: 0.5)
            
            blackView.addGestureRecognizer(UITapGestureRecognizer(target: self, action: #selector(handleDismiss)))
            
            window.addSubview(blackView)
            
            window.addSubview(collectionView)
            
            let height = cellHeight * CGFloat(options.count)
            let y = window.frame.height - height
            
            collectionView.frame = CGRect(x: 8, y: window.frame.height, width: window.frame.width - 16, height: height)
            
            
            blackView.frame = window.frame
            blackView.alpha = 0
            
            UIView.animate(withDuration: 0.5, delay: 0, usingSpringWithDamping: 1, initialSpringVelocity: 1, options: .curveEaseOut, animations: {
                
                self.blackView.alpha = 1
                
                self.collectionView.frame = CGRect(x: 8, y: y - 8, width: self.collectionView.frame.width, height: self.collectionView.frame.height)

                }, completion: nil)
        }
    }
    
    func handleDismiss() {
        UIView.animate(withDuration: 0.5) {
            self.blackView.alpha = 0
            
            if let window = UIApplication.shared.keyWindow {
                self.collectionView.frame = CGRect(x: 8, y: window.frame.height + 8, width: window.frame.width - 16, height: self.collectionView.frame.height)
            }
        }
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return options.count
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: collectionView.frame.width, height: cellHeight)
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: cellId, for: indexPath) as! MenuCell
        
        cell.iconImage.image = UIImage(named: iconOptions[indexPath.item] )
        
        
        if !viewcontroller.isPaused{
            
            if options[indexPath.item] == "Pause" {
            cell.resetLabel.textColor = .gray
            }
        }
        
        cell.resetLabel.text = options[indexPath.item]
        
        if cell.iconImage.image == UIImage(named: "cancel"){
            cell.backgroundColor = UIColor(red:0.93, green:0.93, blue:0.93, alpha:1.00)
        }

        
        return cell
    }
    

    
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        
        let option = options[indexPath.row]
        
        switch (option){
            case "Start":
                handleDismiss()
                viewcontroller.handleStart()
            case "Reset":
                handleDismiss()
                viewcontroller.handleReset()
            case "Pause":
            handleDismiss()
                viewcontroller.handlePause()
            case "Exit":
            exit(0_)
        default:
            handleDismiss()
            
        }
        
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        return 0
    }
    
    override init() {
        super.init()
        //start doing something here maybe....
        collectionView.delegate = self
        collectionView.dataSource = self
        
        collectionView.register(MenuCell.self, forCellWithReuseIdentifier: cellId)
    }
    
}
