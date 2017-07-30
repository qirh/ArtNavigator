//
//  JSONParser.swift
//  ArtNavigator
//
//  Created by saleh on 7/30/17.
//  Copyright © 2017 saleh. All rights reserved.
//

import Foundation

class JSONParser {
    
    // source:
    // https://stackoverflow.com/a/28644494
    static func printFile() {
        print("printFile -- Start")
        
        guard let path = Bundle.main.path(forResource: "dataRevised", ofType: "json") else {
            print("Invalid filename/path.")
            return
        }
        do{
            let data = try Data(contentsOf: URL(fileURLWithPath: path), options: .alwaysMapped)
            let jsonObject = JSON(data: data)

            if jsonObject != JSON.null {
                
                for (_,subJson):(String, JSON) in jsonObject {
                  
                    var isInterior = true
                    
                    if(subJson["Interior-Exterior"].string == "Extrior"){
                        isInterior = false
                    }
                    // white space source:
                    // https://stackoverflow.com/a/26797958
                    let artPiece: ArtPiece = ArtPiece(accessionNumber: subJson["Accession Number"].string!, title: subJson["Title"].string!.replacingOccurrences(of: "\"", with: ""), locationName: subJson["Location Name"].string!, latitude: subJson["Latitude"].int!, longitude: subJson["Longitude"].int!, address: subJson["Address"].string!, isInterior: isInterior, category: Category(rawValue: subJson["Category"].string!.trimmingCharacters(in: .whitespacesAndNewlines))!, objectType: subJson["Object Type"].string!)
                   
                    if(subJson["Last Name"].string! != ""){
                        artPiece.lastName = subJson["Last Name"].string!.trimmingCharacters(in: .whitespacesAndNewlines)
                    }
                    if(subJson["First Name"].string! != ""){
                        artPiece.firstName = subJson["First Name"].string!.trimmingCharacters(in: .whitespacesAndNewlines)
                    }
                    if(subJson["Artist Gender"].string! != ""){
                        artPiece.artistGender = subJson["Artist Gender"].string!.trimmingCharacters(in: .whitespacesAndNewlines)
                    }
                    if(subJson["Year"].string! != ""){
                        artPiece.year = subJson["Year"].string!.trimmingCharacters(in: .whitespacesAndNewlines)
                    }
                    
                    if(subJson["Location Description"].string! != ""){
                        artPiece.locationDescription = subJson["Location Description"].string!.trimmingCharacters(in: .whitespacesAndNewlines)
                    }
                    
                    if(subJson["Material"].string! != ""){
                        artPiece.material = subJson["Material"].string!.trimmingCharacters(in: .whitespacesAndNewlines)
                    }
                    if(subJson["Material Details"].string! != ""){
                        artPiece.materialDetails = subJson["Material Details"].string!.trimmingCharacters(in: .whitespacesAndNewlines)
                    }
                    if(subJson["Size"].string! != ""){
                        artPiece.size = subJson["Size"].string!.trimmingCharacters(in: .whitespacesAndNewlines)
                    }
                    if(subJson["Additional Description"].string! != ""){
                        artPiece.additionalDescription = subJson["Additional Description"].string!.trimmingCharacters(in: .whitespacesAndNewlines)
                    }
                    if(subJson["About The Work"].string! != ""){
                        artPiece.aboutTheWork = subJson["About The Work"].string!.trimmingCharacters(in: .whitespacesAndNewlines)
                    }
                    
                    
                    ArtPieces.addArtPiece(artPiece: artPiece)
                }
                ArtPieces.printArtPieces()
            }
            else {
                print("Could not get json from file, make sure that file contains valid json.")
            }
        }
        catch let error{
            print(error.localizedDescription)
        }
        print("printFile -- End")
    }
}
