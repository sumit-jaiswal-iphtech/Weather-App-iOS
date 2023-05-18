//
//  ViewController.swift
//  weatherApp
//
//  Created by iPHTech 29 on 15/05/23.
//

import UIKit
import Charts

class ViewController: UIViewController {
    
    @IBOutlet weak var mainView: UIView!
    @IBOutlet weak var myTableView: UITableView!
    @IBOutlet weak var analyticsLbl: UILabel!
    @IBOutlet weak var firstView: UIView!
    @IBOutlet weak var monthLbl: UILabel!
    @IBOutlet weak var searchBtn: UIButton!
    @IBOutlet weak var topLinkBtn: UIButton!
    @IBOutlet weak var linkBtn: UIButton!
    @IBOutlet weak var whatsAppbtn: UIButton!
    @IBOutlet weak var questionsBtn: UIButton!
    @IBOutlet weak var lineChartView: LineChartView!
    @IBOutlet weak var myCollectionView: UICollectionView!
    
    let months = ["Jan" , "Feb", "Mar", "Apr", "May", "Jun", "Jul", "Aug", " "]
    let unitsSold = [25.0,35.0,50.0,80.0,75.0,100.0,50.0,25.0,100.0,75.0]
    var dataEntries: [ChartDataEntry] = []
    var dataListArray = [DataList]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        myTableView.delegate = self
        myTableView.dataSource = self
        setUpView()
        setChart(dataPoints: months, values: unitsSold)
        dataListArray = DataList.defaultDataList()
    }
    func setUpView() {
        
        myTableView.rowHeight = 130
        myTableView.layer.cornerRadius = 20
        
        UITabBar.appearance().tintColor = UIColor.black
        
        monthLbl.layer.borderWidth = 0.5
        monthLbl.layer.cornerRadius = 8
        monthLbl.layer.borderColor = UIColor.gray.cgColor
        
        analyticsLbl.layer.borderWidth = 0.5
        analyticsLbl.layer.cornerRadius = 8
        analyticsLbl.layer.borderColor = UIColor.gray.cgColor
        
        mainView.layer.cornerRadius = 20
        mainView.layer.masksToBounds = true
        
        firstView.layer.cornerRadius = 10
        firstView.layer.masksToBounds = true
        
        lineChartView.backgroundColor = .white
        
        // call button function
        setButton()
    }
    func setButton() {
        
        topLinkBtn.layer.cornerRadius = 15
        
        searchBtn.layer.cornerRadius = 5
        searchBtn.layer.borderWidth = 0.5
        searchBtn.layer.borderColor = UIColor.systemGray.cgColor
        
        linkBtn.layer.cornerRadius = 5
        linkBtn.layer.borderWidth = 0.5
        linkBtn.layer.borderColor = UIColor.gray.cgColor
        
        whatsAppbtn.layer.cornerRadius = 5
        whatsAppbtn.layer.borderWidth = 0.5
        whatsAppbtn.layer.borderColor = UIColor.green.cgColor
        
        questionsBtn.layer.cornerRadius = 5
        questionsBtn.layer.borderWidth = 0.5
        questionsBtn.layer.borderColor = UIColor.blue.cgColor
    }
    func setChart(dataPoints: [String], values: [Double]) {
        
        for i in 0 ..< dataPoints.count {
            dataEntries.append(ChartDataEntry(x: Double(i), y: values[i]))
        }
        
        let lineChartDataSet = LineChartDataSet(entries: dataEntries, label: "Represent Month")
        lineChartDataSet.axisDependency = .left
        lineChartDataSet.setColor(UIColor.systemBlue)
        lineChartDataSet.drawFilledEnabled = true
        lineChartDataSet.setCircleColor(UIColor.systemBlue) // our circle will be dark red
        lineChartDataSet.lineWidth = 1.0
        lineChartDataSet.circleRadius = 3.0 // the radius of the node circle
        lineChartDataSet.fillAlpha = 0.1
        lineChartDataSet.fillColor = UIColor.systemBlue
        lineChartDataSet.highlightColor = UIColor.white
        lineChartDataSet.drawCircleHoleEnabled = true
        var dataSets = [LineChartDataSet]()
        dataSets.append(lineChartDataSet)
        let lineChartData = LineChartData(dataSets: dataSets)
        lineChartView.data = lineChartData
        lineChartView.rightAxis.enabled = false
        //      lineChartView.xAxis.drawGridLinesEnabled = false
        //      lineChartView.leftAxis.drawGridLinesEnabled = false
        lineChartView.xAxis.labelPosition = .bottom
        lineChartView.xAxis.valueFormatter = IndexAxisValueFormatter(values: dataPoints)
        lineChartView.legend.enabled = true
    }
}

extension ViewController:UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout  {
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        let width = collectionView.frame.size.width
        return CGSize(width: width, height: width/2 - 50)
    }
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return dataListArray.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "MyCollectionView", for: indexPath) as! MyCollectionView
        cell.cityNameLabel.text = dataListArray[indexPath.row].cityName
        cell.locationLabel.text = dataListArray[indexPath.row].location
        cell.myImage.image = UIImage(named: "\(dataListArray[indexPath.row].myImg)")
        cell.layer.cornerRadius = 15
        return cell
    }
}
extension ViewController:UITableViewDelegate, UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return dataListArray.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "tableViewCell", for: indexPath) as! MyTableViewCell
        cell.layer.cornerRadius = 10
        cell.amazonlinkLbl.layer.borderWidth = 0.5
        cell.amazonlinkLbl.layer.cornerRadius = 10
        cell.amazonlinkLbl.layer.borderColor = UIColor.link.cgColor
        return cell
    }
}
