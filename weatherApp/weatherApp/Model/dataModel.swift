//
//  dataModel.swift
//  weatherApp
//
//  Created by iPHTech 29 on 16/05/23.
//

import Foundation

struct DataList {
    var cityName: String
    var location: String
    var myImg:String
    
    static func defaultDataList() -> [DataList] {
        
        var dataList = [DataList]()
        dataList.append(DataList(cityName: "123", location: "Today's clicks", myImg: "focus"))
        dataList.append(DataList(cityName: "Ahamedabad", location: "Top Loaction", myImg: "location"))
        dataList.append(DataList(cityName: "Instragram", location: "Top Source", myImg: "browser"))
        dataList.append(DataList(cityName: "Facebook", location: "Social Media", myImg: "facebook"))
        dataList.append(DataList(cityName: "123", location: "Today's clicks", myImg: "focus"))
        dataList.append(DataList(cityName: "Ahamedabad", location: "Top Loaction", myImg: "location"))
        dataList.append(DataList(cityName: "Instragram", location: "Top Source", myImg: "browser"))
        dataList.append(DataList(cityName: "Facebook", location: "Social Media", myImg: "facebook"))
        return dataList
    }
}
