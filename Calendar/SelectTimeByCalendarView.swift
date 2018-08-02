//
//  SelectTimeByCalendarView.swift
//  WiFi_Locker
//
//  Created by 笨蛋 on 8/1/18.
//  Copyright © 2018 test. All rights reserved.
//

import UIKit

class CalendarCellView:UICollectionViewCell{
    
    var cover_view:UIView={
        let view = UIView()
        view.isHidden = true
        view.backgroundColor = UIColor(red: 4/255, green: 143/255, blue: 118/255, alpha: 1)
        view.layer.cornerRadius = 12
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    var day_label:UILabel={
        let label = UILabel()
        label.font = UIFont.systemFont(ofSize: 12)
        label.textAlignment = .center
        label.textColor = UIColor.white.withAlphaComponent(0.5)
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    override func prepareForReuse() {
        cover_view.isHidden = true
        day_label.text = ""
        day_label.textColor = UIColor.white.withAlphaComponent(0.5)

    }
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        addSubview(cover_view)
        addSubview(day_label)
        setupConstraint()
    }
    
    func setupConstraint(){
        
        cover_view.centerXAnchor.constraint(equalTo: self.centerXAnchor).isActive = true
        cover_view.centerYAnchor.constraint(equalTo: self.centerYAnchor).isActive = true
        cover_view.widthAnchor.constraint(equalToConstant: 24).isActive = true
        cover_view.heightAnchor.constraint(equalToConstant: 24).isActive = true
        
        day_label.centerXAnchor.constraint(equalTo: self.centerXAnchor).isActive = true
        day_label.centerYAnchor.constraint(equalTo: self.centerYAnchor).isActive = true
        day_label.widthAnchor.constraint(equalToConstant: 24).isActive = true
        day_label.heightAnchor.constraint(equalToConstant: 24).isActive = true
        
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

class SelectTimeByCalendarView: BasicView,UICollectionViewDelegateFlowLayout,UICollectionViewDelegate,UICollectionViewDataSource {
    
    var selected_arr = [Bool](repeating: false, count: 42)
    var date_arr:[Date] = []
    var title_arr = [0:"S",1:"M",2:"T",3:"W",4:"T",5:"F",6:"S"]
    var formatter:DateFormatter={
        let fm = DateFormatter()
        fm.timeZone = .current
        return fm
    }()
    
    var date:Date = Date(){
        didSet{
            self.formatter.dateFormat = "MMM YYYY"
            month_title.text = self.formatter.string(from: date)
        }
    }
    
    let container_view:UIView={
        let view = UIView()
        view.layer.cornerRadius = 4
        view.backgroundColor = MyColor.calendar_bg
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    let title_label:UILabel={
        let label = UILabel()
        label.text = "Select date"
        label.font = UIFont.systemFont(ofSize: 18)
        label.textColor = UIColor.white
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    var month_title:UILabel={
        let label = UILabel()
        label.textAlignment = .center
        label.text = "Select date"
        label.font = UIFont.systemFont(ofSize: 14)
        label.textColor = UIColor.white
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    lazy var pre_month_button:UIButton={
        let btn = UIButton()
        btn.setImage(UIImage(named: "icons8-back-filled-64"), for: .normal)
        btn.translatesAutoresizingMaskIntoConstraints = false
        btn.addTarget(self, action: #selector(handlePreMonth), for: .touchUpInside)
        return btn
    }()
    
    @objc func handlePreMonth(){
        self.date = Calendar.current.date(byAdding: .month, value: -1, to: self.date)!
        setupDate()
    }
    
    @objc func handleNextMonth(){
        self.date = Calendar.current.date(byAdding: .month, value: 1, to: self.date)!
        setupDate()
    }
    
    lazy var next_month_button:UIButton={
        let btn = UIButton()
        btn.setImage(UIImage(named: "icons8-back-filled-64"), for: .normal)
        btn.transform = CGAffineTransform.init(rotationAngle: CGFloat.pi)
        btn.translatesAutoresizingMaskIntoConstraints = false
        btn.addTarget(self, action: #selector(handleNextMonth), for: .touchUpInside)
        return btn
    }()
    
    var titleView:UIStackView={
        let stackView = UIStackView()
        stackView.layer.cornerRadius = 4
        stackView.axis = .horizontal
        stackView.alignment = .fill
        stackView.spacing = 0
        stackView.distribution = .fillEqually
        stackView.translatesAutoresizingMaskIntoConstraints = false
        return stackView
    }()

    lazy var collectionview:UICollectionView={
        let layout = UICollectionViewFlowLayout()
        layout.scrollDirection = .vertical
        let cv = UICollectionView(frame: .zero, collectionViewLayout: layout)
        cv.backgroundColor = UIColor.clear
        cv.delegate = self
        cv.dataSource = self
        cv.register(CalendarCellView.self, forCellWithReuseIdentifier: "cell")
        cv.translatesAutoresizingMaskIntoConstraints = false
        return cv
    }()
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return date_arr.count
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: (UIScreen.main.bounds.width-96)/7, height: 24)
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        return 4
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumInteritemSpacingForSectionAt section: Int) -> CGFloat {
        return 0
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionview.dequeueReusableCell(withReuseIdentifier: "cell", for: indexPath) as! CalendarCellView
        cell.cover_view.isHidden = !selected_arr[indexPath.item]
        if isCurrentMonth(date: date_arr[indexPath.item]){
            self.formatter.dateFormat = "dd"
            cell.day_label.text = self.formatter.string(from: date_arr[indexPath.item])
            if !isDisableDay(date: date_arr[indexPath.item]){
                cell.day_label.textColor = UIColor.white
            }
        }
        
        return cell
    }
    
    func isCurrentMonth(date:Date)->Bool{
        if date.timeIntervalSinceReferenceDate < self.date.startOfMonth().timeIntervalSinceReferenceDate || date.timeIntervalSinceReferenceDate > self.date.endOfMonth().timeIntervalSinceReferenceDate{
            return false
        }
        return true
    }
    
    func isDisableDay(date:Date)->Bool{
        let currentDate = Date()
        if date.timeIntervalSinceReferenceDate <= currentDate.timeIntervalSinceReferenceDate {
            return true
        }
        return false
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        handleSelectedDate(index: indexPath.item)
    }
    
    func handleSelectedDate(index:Int){
        if !isDisableDay(date: date_arr[index]) && isCurrentMonth(date: date_arr[index]){
            let statu = selected_arr[index]
            selected_arr[index] = !statu
            
            self.collectionview.reloadData()
        }
    }
    
    lazy var cancel_button:UIButton={
        let btn = UIButton()
        btn.setTitle("Cancel", for: .normal)
        btn.titleLabel?.font = UIFont.boldSystemFont(ofSize: 14)
        btn.setTitleColor(UIColor.white, for: .normal)
        btn.translatesAutoresizingMaskIntoConstraints = false
        btn.addTarget(self, action: #selector(handleCancel), for: .touchUpInside)
        return btn
    }()
    
    @objc func handleCancel(){
        self.removeFromSuperview()
    }
    
    lazy var ok_button:UIButton={
        let btn = UIButton()
        btn.setTitle("Ok", for: .normal)
        btn.titleLabel?.font = UIFont.boldSystemFont(ofSize: 14)

        btn.setTitleColor(UIColor.white, for: .normal)
        btn.translatesAutoresizingMaskIntoConstraints = false
        btn.addTarget(self, action: #selector(handleOk), for: .touchUpInside)
        return btn
    }()
    
    @objc func handleOk(){
        handleCancel()
    }
    
    
    
    override func setupView() {
        backgroundColor = UIColor.black.withAlphaComponent(0.5)
        
        setupDate()
        addSubview(container_view)
        container_view.addSubview(title_label)
        container_view.addSubview(month_title)
        container_view.addSubview(pre_month_button)
        container_view.addSubview(next_month_button)
        container_view.addSubview(titleView)
        container_view.addSubview(collectionview)
        container_view.addSubview(cancel_button)
        container_view.addSubview(ok_button)
        setupConstraint()
        
        for i in 0..<7{
            let label = UILabel()
//            label.backgroundColor = UIColor(red: 4/255, green: 143/255, blue: 118/255, alpha: 1)
            label.textColor = UIColor.white.withAlphaComponent(0.8)
            label.textAlignment = .center
            label.font = UIFont.systemFont(ofSize: 12)
            label.text = title_arr[i]
            titleView.addArrangedSubview(label)
        }
        
    }
    
    func setupDate(){
        self.date_arr = []
        let date:Date = self.date.startOfMonth()
        let day_index = date.dayOfWeek()
        print("index \(day_index)")
        for i in 0..<42{
            let after_day = Calendar.current.date(byAdding: .day, value: i-day_index, to: date)!
            date_arr.append(after_day)
        }
        self.collectionview.reloadData()
    }
    
    func setupConstraint(){
        container_view.centerYAnchor.constraint(equalTo: self.centerYAnchor).isActive = true
        container_view.centerXAnchor.constraint(equalTo: self.centerXAnchor).isActive = true
        container_view.widthAnchor.constraint(equalTo: self.widthAnchor, constant: -32).isActive = true
        container_view.heightAnchor.constraint(equalToConstant: 320).isActive = true
        
        title_label.topAnchor.constraint(equalTo: container_view.topAnchor,constant:32).isActive = true
        title_label.centerXAnchor.constraint(equalTo: container_view.centerXAnchor).isActive = true
        title_label.widthAnchor.constraint(equalTo: container_view.widthAnchor,constant:-64).isActive = true
        title_label.heightAnchor.constraint(equalToConstant: 24).isActive = true
        
        month_title.topAnchor.constraint(equalTo: title_label.bottomAnchor,constant:16).isActive = true
        month_title.centerXAnchor.constraint(equalTo: container_view.centerXAnchor).isActive = true
        month_title.widthAnchor.constraint(equalTo: container_view.widthAnchor,constant:-160).isActive = true
        month_title.heightAnchor.constraint(equalToConstant: 24).isActive = true
        
        pre_month_button.centerYAnchor.constraint(equalTo: month_title.centerYAnchor).isActive = true
        pre_month_button.rightAnchor.constraint(equalTo: month_title.leftAnchor).isActive = true
        pre_month_button.widthAnchor.constraint(equalToConstant: 16).isActive = true
        pre_month_button.heightAnchor.constraint(equalToConstant: 16).isActive = true
        
        next_month_button.centerYAnchor.constraint(equalTo: month_title.centerYAnchor).isActive = true
        next_month_button.leftAnchor.constraint(equalTo: month_title.rightAnchor).isActive = true
        next_month_button.widthAnchor.constraint(equalToConstant: 16).isActive = true
        next_month_button.heightAnchor.constraint(equalToConstant: 16).isActive = true
        
        titleView.topAnchor.constraint(equalTo: month_title.bottomAnchor, constant: 8).isActive = true
        titleView.leftAnchor.constraint(equalTo: title_label.leftAnchor).isActive = true
        titleView.widthAnchor.constraint(equalTo: title_label.widthAnchor).isActive = true
        titleView.heightAnchor.constraint(equalToConstant: 24).isActive = true
        
        collectionview.topAnchor.constraint(equalTo: titleView.bottomAnchor).isActive = true
        collectionview.centerXAnchor.constraint(equalTo: container_view.centerXAnchor).isActive = true
        collectionview.widthAnchor.constraint(equalTo: titleView.widthAnchor).isActive = true
        collectionview.heightAnchor.constraint(greaterThanOrEqualToConstant: 160).isActive = true
        
        cancel_button.topAnchor.constraint(equalTo: collectionview.bottomAnchor,constant:-8).isActive = true
        cancel_button.leftAnchor.constraint(equalTo: container_view.centerXAnchor).isActive = true
        cancel_button.widthAnchor.constraint(equalTo: container_view.widthAnchor, multiplier: 1/4).isActive = true
        cancel_button.heightAnchor.constraint(equalToConstant: 32).isActive = true
        
        ok_button.topAnchor.constraint(equalTo: cancel_button.topAnchor).isActive = true
        ok_button.leftAnchor.constraint(equalTo: cancel_button.rightAnchor).isActive = true
        ok_button.widthAnchor.constraint(equalTo: cancel_button.widthAnchor).isActive = true
        ok_button.heightAnchor.constraint(equalToConstant: 32).isActive = true
        
    }

}
