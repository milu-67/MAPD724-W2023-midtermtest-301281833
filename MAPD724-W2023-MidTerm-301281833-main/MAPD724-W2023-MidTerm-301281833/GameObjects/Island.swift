import GameplayKit
import SpriteKit

class Island : GameObject
{
    init()
    {
        super.init(imageString: "island", initialScale: 1.0)
        Start()
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    
    
    override func Start()
    {
        zPosition = Layer.island.rawValue
        verticalSpeed = 5.0
        horizontalSpeed = 5.0
        Reset()
    }
    
    override func Update()
    {
        Move()
        CheckBounds()
    }
    
    override func CheckBounds()
    {
        if(position.x <= -730)
        {
            Reset()
        }
    }
    
    override func Reset()
    {
        position.x = 730
        // get a pseudo random number
        let randomY:Int = (randomSource?.nextInt(upperBound: 616))! - 313
        position.y = CGFloat(randomY)
        isColliding = false
    }
    
    func Move()
    {
        position.x -= horizontalSpeed!
    }
}
