//
//  MainViewController.swift
//  HealthFood
//
//  Created by Mobios on 1/30/23.
//  Copyright © 2023 Pabasara. All rights reserved.
//

import UIKit
class MainViewController: UIViewController  {
    
    let selected_cate = "today"
    let controller = Controller();
    var foodListHealth:[FoodModel]=[ ]
    var foodListDiet:[FoodModel]=[ ]
    var foodListCommon:[FoodModel]=[ ]
    var foodListToday:[FoodModel]=[]
    let reusableId = "cellId"
    let foodLayout = FoodCompositionalLayout.shared
    
    
    var myCollectionView:UICollectionView?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setupViews()
        setupConstraints()
        customBackButton()
        collectionView.delegate = self
        collectionView.dataSource = self
        collectionView.register(FoodCollectionViewCell.self, forCellWithReuseIdentifier: FoodCollectionViewCell.reusableId)

        collectionView.register(HeaderCollectionReusableView.self, forSupplementaryViewOfKind: HeaderCollectionReusableView.reusableId, withReuseIdentifier: HeaderCollectionReusableView.reusableId)
        collectionView.register(UICollectionViewCell.self, forCellWithReuseIdentifier: reusableId)
        
        
        controller.getFoods(category: "today") { (foodListGet) in
            DispatchQueue.main.async {
            self.foodListToday = foodListGet;
                self.collectionView.reloadData();
            }
        }
        controller.getFoods(category: "health") { (foodListGet) in
            DispatchQueue.main.async {
            self.foodListHealth = foodListGet;
                self.collectionView.reloadData();
            }
        }
        controller.getFoods(category: "common") { (foodListGet) in
            DispatchQueue.main.async {
            self.foodListCommon = foodListGet;
                self.collectionView.reloadData();
            }
        }
        controller.getFoods(category: "diet") { (foodListGet) in
            DispatchQueue.main.async {
            self.foodListDiet = foodListGet;
                self.collectionView.reloadData();
            }
        }

    }
    
    func getFoodList(category:String)->[FoodModel]{
        var foods : [FoodModel] = []
        controller.getFoods(category: category) { (foodListGet) in
            foods = foodListGet;
        }
       
        return foods;
    }
    
    func customBackButton(){
        // custom back button
        navigationController?.navigationBar.backIndicatorImage = UIImage(systemName: "arrow.backward",withConfiguration: UIImage.SymbolConfiguration(weight: .medium))
        navigationController?.navigationBar.backIndicatorTransitionMaskImage = UIImage(systemName: "arrow.backward",withConfiguration: UIImage.SymbolConfiguration(weight: .medium))
        navigationController?.navigationBar.topItem?.backBarButtonItem = UIBarButtonItem(title: "", style: .done, target: .none, action: .none)
        navigationController?.navigationBar.tintColor = .black
    }
    
    // MARK: Properties -
    let container: UIView = {
        let v = UIView()
        v.translatesAutoresizingMaskIntoConstraints = false
        return v
    }()
    
    let collectionView: UICollectionView = {
        let cv = UICollectionView(frame: .zero, collectionViewLayout: UICollectionViewFlowLayout.init())
        cv.translatesAutoresizingMaskIntoConstraints = false
        cv.showsVerticalScrollIndicator = false
        cv.backgroundColor = .clear
        return cv
    }()
    
    
    func setupViews(){
        view.addSubview(container)
        container.addSubview(collectionView)
        setupCompositionalLayout()
    }
    func setupCompositionalLayout(){
        let layout = UICollectionViewCompositionalLayout { sectionNumber, env in
            
            return self.foodLayout.discountLayout()
            
        }
        collectionView.setCollectionViewLayout(layout, animated: true)
    }
    func setupConstraints(){
        container.pin(to: view)
        NSLayoutConstraint.activate([
            
            collectionView.topAnchor.constraint(equalTo: container.topAnchor),
            collectionView.leadingAnchor.constraint(equalTo: container.leadingAnchor),
            collectionView.trailingAnchor.constraint(equalTo: container.trailingAnchor),
            collectionView.bottomAnchor.constraint(equalTo: container.bottomAnchor),
            
        ])
    }
    
    override func viewDidAppear(_ animated: Bool) {
        print("apper")
    }
    
 
    
}


extension MainViewController: UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout{
    
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        return 4
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        if section == 0{
            print(foodListHealth.count)
            return foodListToday.count
        }
        else if section == 1{
            return foodListCommon.count
        }
        else if section == 2{
            return foodListDiet.count
        }
        else if section == 3{
            return foodListHealth.count
        }
        else if section == 4{
            return foodListCommon.count
        }
        return Int()
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        if indexPath.section == 0 {
            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: FoodCollectionViewCell.reusableId, for: indexPath) as! DiscountCollectionViewCell
            cell.data = foodListToday[indexPath.row]
            return cell
        }
        else if indexPath.section == 1 {
            let cell = collectionView.dequeueReusableCell(withReuseIdentifier:FoodCollectionViewCell.reusableId, for: indexPath) as! DiscountCollectionViewCell
            cell.data = foodListCommon[indexPath.row]
            return cell
        }
        else if indexPath.section == 2 {
            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: FoodCollectionViewCell.reusableId, for: indexPath) as! DiscountCollectionViewCell
            cell.data = foodListDiet[indexPath.row]
            return cell
        }
        else if indexPath.section == 3 {
            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: FoodCollectionViewCell.reusableId, for: indexPath) as! DiscountCollectionViewCell
            cell.data = foodListHealth[indexPath.row]
            return cell
        }
        else{
            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: reusableId, for: indexPath)
            return cell
        }
    }
    
    
    func collectionView(_ collectionView: UICollectionView, viewForSupplementaryElementOfKind kind: String, at indexPath: IndexPath) -> UICollectionReusableView {
        let view = collectionView.dequeueReusableSupplementaryView(ofKind: kind, withReuseIdentifier: HeaderCollectionReusableView.reusableId, for: indexPath) as! HeaderCollectionReusableView
        if indexPath.section == 0 {
            view.headingLabel.text = "Today Food"
        }
        else if indexPath.section == 1 {
            view.headingLabel.text = "Common Food"
        }
        else if indexPath.section == 2 {
            view.headingLabel.text = "Deit Food"
        }
        else if indexPath.section == 3 {
            view.headingLabel.text = "Health Food"
        }
        return view
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        let vc = FoodViewController()
        if indexPath.section == 0{
            let food = foodListToday[indexPath.row]
            vc.food = food;
        }
        if indexPath.section == 1{
            let food = foodListCommon[indexPath.row]
            vc.food = food;
        }
        if indexPath.section == 2{
            let food = foodListDiet[indexPath.row]
            vc.food = food;
        }
        if indexPath.section == 3{
            let food = foodListHealth[indexPath.row]
            vc.food = food;
        }
        navigationController?.pushViewController(vc, animated: true)
    }
}




extension UIView {
    
    func pin(to superview: UIView){
        translatesAutoresizingMaskIntoConstraints = false
        topAnchor.constraint(equalTo: superview.safeAreaLayoutGuide.topAnchor).isActive = true
        leadingAnchor.constraint(equalTo: superview.leadingAnchor).isActive = true
        trailingAnchor.constraint(equalTo: superview.trailingAnchor).isActive = true
        bottomAnchor.constraint(equalTo: superview.safeAreaLayoutGuide.bottomAnchor).isActive = true
    }
    
    func addBottomShadows(){
        layer.shadowColor = color.grey.cgColor
        layer.shadowRadius = 3
        layer.masksToBounds  = false
        layer.shadowOffset =  CGSize(width: 0, height: 3)
        layer.shadowOpacity = 0.6
        backgroundColor = .white
        layer.shadowPath = CGPath(rect: CGRect(x: 0,y: bounds.maxY - layer.shadowRadius,width: bounds.width,height: layer.shadowRadius), transform: .none)
    }
    func removeBottomShadows(){
        layer.shadowColor = UIColor.white.cgColor
        layer.shadowOffset =  CGSize(width: 0, height: 3)
        layer.shadowRadius = 0
        layer.masksToBounds  = false
        layer.shadowOpacity = 0
        layer.shadowPath = nil
    }
}
