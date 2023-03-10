import GameplayKit
import SpriteKit

class Ocean : GameObject
{
    init()
    {
        super.init(imageString: "ocean", initialScale: 2.0)
        Start()
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func Start()
    {
        zPosition = Layer.ocean.rawValue
        verticalSpeed = 5.0
        horizontalSpeed = 5.0
    }
    
    override func Update()
    {
        Move()
        CheckBounds()
    }
    
    override func CheckBounds()
    {
        if(position.x <= -773)
        {
            Reset()
        }
    }
    
    override func Reset()
    {
        position.x = 773
    }
    
    func Move()
    {
        position.x -= horizontalSpeed!
    }
}
