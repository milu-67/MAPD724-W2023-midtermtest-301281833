import GameplayKit
import SpriteKit

class Cloud : GameObject
{
    init()
    {
        super.init(imageString: "cloud", initialScale: 0.6)
        Start()
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    
    override func Start()
    {
        zPosition = Layer.cloud.rawValue
        alpha = 0.5 // 50% transparent
        Reset()
    }
    
    override func Update()
    {
        Move()
        CheckBounds()
    }
    
    override func CheckBounds()
    {
        if(position.x <= -756)
        {
            Reset()
        }
    }
    
    override func Reset()
    {
        // randomize the vertical speed: 5 to 10
        verticalSpeed = CGFloat((randomSource?.nextUniform())! * -4.0) + 2.0
        
        // randomize the horizontal speed: -2 to 2
        horizontalSpeed = CGFloat((randomSource?.nextUniform())! * 5.0) + 5.0
        
        // get a pseudo random number for the Y position: -262 to 262
        let randomY:Int = (randomSource?.nextInt(upperBound: 524))! - 262
        position.y = CGFloat(randomY)
        
        let randomX:Int = (randomSource?.nextInt(upperBound: 30))! + 902
        position.x = CGFloat(randomX)
        
        isColliding = false
    }
    
    func Move()
    {
        position.x -= horizontalSpeed!
        position.y -= verticalSpeed!
    }
}
