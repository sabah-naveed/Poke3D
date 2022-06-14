//
//  ViewController.swift
//  Poke3D
//
//  Created by Sabah Naveed on 6/13/22.
//

import UIKit
import SceneKit
import ARKit

class ViewController: UIViewController, ARSCNViewDelegate {

    @IBOutlet var sceneView: ARSCNView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Set the view's delegate
        sceneView.delegate = self
        
        // Show statistics such as fps and timing information
        sceneView.showsStatistics = true
        
        sceneView.autoenablesDefaultLighting = true
        
        
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        // Create a session configuration
        let configuration = ARImageTrackingConfiguration()
        
        if let imageToTrack = ARReferenceImage.referenceImages(inGroupNamed: "PokemonCards", bundle: Bundle.main) {
        
            configuration.trackingImages = imageToTrack
            configuration.maximumNumberOfTrackedImages = 4
            
            print("images successfully added")
        }

        // Run the view's session
        sceneView.session.run(configuration)
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        
        // Pause the view's session
        sceneView.session.pause()

    }

    // MARK: - ARSCNViewDelegate
    
    func renderer(_ renderer: SCNSceneRenderer, nodeFor anchor: ARAnchor) -> SCNNode? {
        //look at anchor that got detected and return the node
        let node = SCNNode()
        
        if let imageAnchor = anchor as? ARImageAnchor {
            
            let cardType = imageAnchor.referenceImage.name!
            
            let plane = SCNPlane(width: imageAnchor.referenceImage.physicalSize.width, height: imageAnchor.referenceImage.physicalSize.height)
            plane.firstMaterial?.diffuse.contents = UIColor(white: 1.0, alpha: 0.5)
            let planeNode = SCNNode(geometry: plane)
            planeNode.eulerAngles.x = -.pi/2
            
            node.addChildNode(planeNode)
            
            if cardType == "eevee" {
                if let pokeScene = SCNScene(named: "art.scnassets/eevee.scn"){
                    if let pokeNode = pokeScene.rootNode.childNodes.first{
                        pokeNode.eulerAngles.x = .pi/2
                        planeNode.addChildNode(pokeNode)
                    }
                }
            }
            
            if cardType == "burmy" {
                if let pokeScene = SCNScene(named: "art.scnassets/burmy.scn"){
                    if let pokeNode = pokeScene.rootNode.childNodes.first{
                        pokeNode.eulerAngles.x = .pi/2
                        planeNode.addChildNode(pokeNode)
                    }
                }
            }
            
            if cardType == "pancham" {
                if let pokeScene = SCNScene(named: "art.scnassets/pancham.scn"){
                    if let pokeNode = pokeScene.rootNode.childNodes.first{
                        pokeNode.eulerAngles.x = .pi/2
                        planeNode.addChildNode(pokeNode)
                    }
                }
            }
            
            if cardType == "honedge" {
                if let pokeScene = SCNScene(named: "art.scnassets/honedge.scn"){
                    if let pokeNode = pokeScene.rootNode.childNodes.first{
                        pokeNode.eulerAngles.x = .pi/2
                        planeNode.addChildNode(pokeNode)
                    }
                }
            }
            
            if cardType == "oddish" {
                if let pokeScene = SCNScene(named: "art.scnassets/oddish.scn"){
                    if let pokeNode = pokeScene.rootNode.childNodes.first{
                        pokeNode.eulerAngles.x = .pi/2
                        planeNode.addChildNode(pokeNode)
                    }
                }
            }
            
            
        }
        return node
    }
}
