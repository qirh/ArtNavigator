//
//  ArtPieces.swift
//  ArtNavigator
//
//  Created by saleh on 7/30/17.
//  Copyright © 2017 saleh. All rights reserved.
//

import Foundation


class ArtPieces {
    static var artPieces: [ArtPiece] = []
  
    
    static func addArtPiece(artPiece: ArtPiece) {
        artPieces.append(artPiece)
    }
    
    static func printArtPieces() {
        print("printArtPieces -- start")
        /*
        for artPiece in artPieces {
            
            print("Accession Number =  \(artPiece.accessionNumber)")
            print("Title =  \(artPiece.title)")
            print("Location Name =  \(artPiece.locationName)")
            print("Latitude =  \(artPiece.latitude)")
            print("Longitude =  \(artPiece.longitude)")
            print("Address =  \(artPiece.address)")
            print("Category = \(artPiece.category)")
            print("Material = \(artPiece.material)")
            
            
            print("****")
        }
        */
        print("printArtPieces -- end")
    }
    
    static func commitArtPieces(){
    
    }
}

// source:
// https://stackoverflow.com/a/30009873
enum Category : String{                         //Values in JSON file
    case sculpture = "Sculpture"                //Sculpture
    case mural = "Mural"                        //Mural
    case electronicMedia = "Electronic Media"   //Electronic Media
}

class ArtPiece {
    
                                    //Column Names in JSON file
    var accessionNumber: String     //Accession Number i.e id on the city's website
    var lastName: String?           //Last Name
    var firstName: String?          //First Name
    var artistGender: String?       //Artist Gender
    var title: String               //Title
    var year: String?               //Year
    
    
    var locationName: String        //Location Name
    var latitude: Int               //Latitude
    var longitude: Int              //Longitude
    var address: String             //Address
    
    
    var locationDescription: String?    //Location Description
    var isInterior: Bool                //Interior-Exterior
    var category: Category              //Category
    var objectType: String              //Object Type
    var material: String?               //Material
    var materialDetails: String?        //Material Details
    var size: String?                   //Size
    var additionalDescription: String?  //Additional Description
    var aboutTheWork: String?           //About The Work
    
    init(accessionNumber: String, title: String, locationName: String, latitude: Int, longitude: Int, address: String, isInterior: Bool, category: Category, objectType: String){
        self.accessionNumber = accessionNumber
        self.title = title
        self.locationName = locationName
        self.latitude = latitude
        self.longitude = longitude
        self.address = address
        self.isInterior = isInterior
        self.category = category
        self.objectType = objectType
    }
    
}
