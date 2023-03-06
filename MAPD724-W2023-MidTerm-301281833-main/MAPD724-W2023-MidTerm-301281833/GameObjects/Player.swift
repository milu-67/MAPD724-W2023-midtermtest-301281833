import GameplayKit
import SpriteKit

class Player : GameObject
{
    init()
    {
        super.init(imageString: "plane", initialScale: 1.0)
        Start()
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func Start()
    {
        zPosition = Layer.plane.rawValue
        Reset()
    }
    
    override func Update()
    {
        CheckBounds()
    }
    
    override func CheckBounds()
    {
        if(position.y <= -255)
        {
            position.y = -255
        }
        
        if(position.y >= 255)
        {
            position.y = 255
        }
    }
    
    override func Reset()
    {
        position.y = -495
    }
    
    func TouchMove(newPos: CGPoint)
    {
        position = newPos
    }
    
}
