
//
//  NodeSetup
//  Aire
//
//  Created by Pau Escalante on 7/7/18.
//  Copyright © 2018 QuimeraVerde. All rights reserved.
//

import Foundation
import SceneKit
import ARKit

extension ViewController {
    
    // creates multiple nodes
    func createPollutants(pollutants: Dictionary<String,Pollutant>){
        
        // Store pollutants in global variable
        pollutantsInfo = pollutants
        
        // iterate through dictionary of pollutants
        for (key, value) in pollutants {
            // make sure there is data in pollutant
            if (value.count > 0){
                
                // iterate through count of pollutants to add them to sceneview
                for i in 1...value.count {
                    addPollutant(pollutantModelName: key, index:i)
                }
            }
        }
    }
    
    // remove all nodes from scene view
    func removePollutants(){
        sceneView.scene.rootNode.enumerateChildNodes { (node, stop) in
            node.removeFromParentNode()
        }
        
        // Clean dictionary for pollutants in global variable
        pollutantsInfo = Dictionary<String,Pollutant>()
    }
    
    func addTimestamp(timestamp: Date){
        lastUpdated.text = "Última actualización: " + timestamp.description
    }
    
    // add individual node pollutant
    func addPollutant(pollutantModelName: String, index: Int) {
        let pollutantModel = PollutantModel()
        pollutantModel.loadModel(modelName:pollutantModelName)
        sceneView.scene.rootNode.addChildNode(pollutantModel)
        
        // animate pollutant
        pollutantModel.animate(objectCount:index)
        
        // randomize position
        pollutantModel.randomPosition(objectCount:index)
    }
    
    // shortcuts to getting the pollutant name that is hidden
    func getNodePollutantName(node: SCNNode) -> String{
        // grab name of node for identification purposes
        let nodeName: String = node.name ?? "none"
        
        // check if label
        if (nodeName == "label") {
            return node.geometry?.name ?? "none"
        }
        
        return nodeName
    }
}
