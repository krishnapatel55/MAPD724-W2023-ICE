//
//  GameProtocol.swift
//  MAPD724-W2023-ICE1
//
//  Created by Kisu on 2023-01-18.
//

protocol GameProtocol
{
    //Initialization
    func Start()

    //update every frame
    func Update()
    
    //check if the position is outside the bounds of the screen
    func CheckBounds()
    
    //a method to reset the position
    func Reset()
}
