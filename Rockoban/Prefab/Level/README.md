# How to make a level in JSON

## Unique Levels:
*These levels perform a specific purpose in the game*

    Level000  = Main Menu
    Level00-1 = Pause Menu
    Level00-2 = Level Select Menu

## Tile Attributes:
*Certain groups tiles have specific attributes.*

**All attributes are lowercase unless otherwise specified.*

---
### Color:
All nodes can have there original color modulated.

*Usage:*
> `color: "<String>"`

**Available Colors**:

- ![](https://placehold.it/15/808080/000000?text=+) gray              
- ![](https://placehold.it/15/F0F8FF/000000?text=+) aliceblue      
- ![](https://placehold.it/15/FAEBD7/000000?text=+) antiquewhite      
- ![](https://placehold.it/15/00FFFF/000000?text=+) aqua     
- ![](https://placehold.it/15/7FFFD4/000000?text=+) aquamarine    
- ![](https://placehold.it/15/F0FFFF/000000?text=+) azure       
- ![](https://placehold.it/15/F5F5DC/000000?text=+) beige             
- ![](https://placehold.it/15/FFE4C4/000000?text=+) bisque         
- ![](https://placehold.it/15/000000/000000?text=+) black    
- ![](https://placehold.it/15/FFEBCD/000000?text=+) blanchedalmond
- ![](https://placehold.it/15/0000FF/000000?text=+) blue     
- ![](https://placehold.it/15/8A2BE2/000000?text=+) blueviolet        
- ![](https://placehold.it/15/A52A2A/000000?text=+) brown             
- ![](https://placehold.it/15/DEB887/000000?text=+) burlywood         
- ![](https://placehold.it/15/5F9EA0/000000?text=+) cadetblue         
- ![](https://placehold.it/15/7FFF00/000000?text=+) chartreuse 
- ![](https://placehold.it/15/D2691E/000000?text=+) chocolate         
- ![](https://placehold.it/15/FF7F50/000000?text=+) coral         
- ![](https://placehold.it/15/6495ED/000000?text=+) cornflower        
- ![](https://placehold.it/15/FFF8DC/000000?text=+) cornsilk       
- ![](https://placehold.it/15/DC143C/000000?text=+) crimson           
- ![](https://placehold.it/15/00FFFF/000000?text=+) cyan     
- ![](https://placehold.it/15/00008B/000000?text=+) darkblue    
- ![](https://placehold.it/15/008B8B/000000?text=+) darkcyan       
- ![](https://placehold.it/15/B8860B/000000?text=+) darkgoldenrod     
- ![](https://placehold.it/15/A9A9A9/000000?text=+) darkgray          
- ![](https://placehold.it/15/006400/000000?text=+) darkgreen   
- ![](https://placehold.it/15/BDB76B/000000?text=+) darkkhaki         
- ![](https://placehold.it/15/8B008B/000000?text=+) darkmagenta    
- ![](https://placehold.it/15/556B2F/000000?text=+) darkolivegreen    
- ![](https://placehold.it/15/FF8C00/000000?text=+) darkorange  
- ![](https://placehold.it/15/9932CC/000000?text=+) darkorchid     
- ![](https://placehold.it/15/8B0000/000000?text=+) darkred     
- ![](https://placehold.it/15/E9967A/000000?text=+) darksalmon        
- ![](https://placehold.it/15/8FBC8F/000000?text=+) darkseagreen      
- ![](https://placehold.it/15/483D8B/000000?text=+) darkslateblue     
- ![](https://placehold.it/15/2F4F4F/000000?text=+) darkslategray     
- ![](https://placehold.it/15/00CED1/000000?text=+) darkturquoise  
- ![](https://placehold.it/15/9400D3/000000?text=+) darkviolet     
- ![](https://placehold.it/15/FF1493/000000?text=+) deeppink       
- ![](https://placehold.it/15/00BFFF/000000?text=+) deepskyblue 
- ![](https://placehold.it/15/696969/000000?text=+) dimgray           
- ![](https://placehold.it/15/1E90FF/000000?text=+) dodgerblue     
- ![](https://placehold.it/15/B22222/000000?text=+) firebrick        
- ![](https://placehold.it/15/FFFAF0/000000?text=+) floralwhite    
- ![](https://placehold.it/15/228B22/000000?text=+) forestgreen       
- ![](https://placehold.it/15/FF00FF/000000?text=+) fuchsia  
- ![](https://placehold.it/15/DCDCDC/000000?text=+) gainsboro         
- ![](https://placehold.it/15/F8F8FF/000000?text=+) ghostwhite     
- ![](https://placehold.it/15/FFD700/000000?text=+) gold        
- ![](https://placehold.it/15/DAA520/000000?text=+) goldenrod         
- ![](https://placehold.it/15/008000/000000?text=+) green    
- ![](https://placehold.it/15/ADFF2F/000000?text=+) greenyellow    
- ![](https://placehold.it/15/F0FFF0/000000?text=+) honeydew       
- ![](https://placehold.it/15/FF69B4/000000?text=+) hotpink        
- ![](https://placehold.it/15/CD5C5C/000000?text=+) indianred        
- ![](https://placehold.it/15/4B0082/000000?text=+) indigo         
- ![](https://placehold.it/15/FFFFF0/000000?text=+) ivory       
- ![](https://placehold.it/15/F0E68C/000000?text=+) khaki            
- ![](https://placehold.it/15/E6E6FA/000000?text=+) lavender        
- ![](https://placehold.it/15/FFF0F5/000000?text=+) lavenderblush  
- ![](https://placehold.it/15/7CFC00/000000?text=+) lawngreen      
- ![](https://placehold.it/15/FFFACD/000000?text=+) lemonchiffon  
- ![](https://placehold.it/15/ADD8E6/000000?text=+) lightblue        
- ![](https://placehold.it/15/F08080/000000?text=+) lightcoral      
- ![](https://placehold.it/15/E0FFFF/000000?text=+) lightcyan   
- ![](https://placehold.it/15/FAFAD2/000000?text=+) lightgoldenrod    
- ![](https://placehold.it/15/D3D3D3/000000?text=+) lightgray         
- ![](https://placehold.it/15/90EE90/000000?text=+) lightgreen        
- ![](https://placehold.it/15/FFB6C1/000000?text=+) lightpink      
- ![](https://placehold.it/15/FFA07A/000000?text=+) lightsalmon    
- ![](https://placehold.it/15/20B2AA/000000?text=+) lightseagreen    
- ![](https://placehold.it/15/87CEFA/000000?text=+) lightskyblue      
- ![](https://placehold.it/15/778899/000000?text=+) lightslategray   
- ![](https://placehold.it/15/B0C4DE/000000?text=+) lightsteelblue    
- ![](https://placehold.it/15/FFFFE0/000000?text=+) lightyellow 
- ![](https://placehold.it/15/00FF00/000000?text=+) lime     
- ![](https://placehold.it/15/32CD32/000000?text=+) limegreen      
- ![](https://placehold.it/15/FAF0E6/000000?text=+) linen            
- ![](https://placehold.it/15/FF00FF/000000?text=+) magenta  
- ![](https://placehold.it/15/800000/000000?text=+) maroon            
- ![](https://placehold.it/15/66CDAA/000000?text=+) mediumaquamarine
- ![](https://placehold.it/15/0000CD/000000?text=+) mediumblue 
- ![](https://placehold.it/15/BA55D3/000000?text=+) mediumorchid      
- ![](https://placehold.it/15/9370DB/000000?text=+) mediumpurple      
- ![](https://placehold.it/15/3CB371/000000?text=+) mediumseagreen   
- ![](https://placehold.it/15/7B68EE/000000?text=+) mediumslateblue   
- ![](https://placehold.it/15/00FA9A/000000?text=+) mediumspringgr
- ![](https://placehold.it/15/48D1CC/000000?text=+) mediumturquoise  
- ![](https://placehold.it/15/C71585/000000?text=+) mediumvioletred   
- ![](https://placehold.it/15/191970/000000?text=+) midnightblue    
- ![](https://placehold.it/15/F5FFFA/000000?text=+) mintcream      
- ![](https://placehold.it/15/FFE4E1/000000?text=+) mistyrose      
- ![](https://placehold.it/15/FFE4B5/000000?text=+) moccasin       
- ![](https://placehold.it/15/FFDEAD/000000?text=+) navajowhite    
- ![](https://placehold.it/15/000080/000000?text=+) navyblue   
- ![](https://placehold.it/15/FDF5E6/000000?text=+) oldlace          
- ![](https://placehold.it/15/808000/000000?text=+) olive        
- ![](https://placehold.it/15/6B8E23/000000?text=+) olivedrab         
- ![](https://placehold.it/15/FFA500/000000?text=+) orange      
- ![](https://placehold.it/15/FF4500/000000?text=+) orangered   
- ![](https://placehold.it/15/DA70D6/000000?text=+) orchid            
- ![](https://placehold.it/15/EEE8AA/000000?text=+) palegoldenrod     
- ![](https://placehold.it/15/98FB98/000000?text=+) palegreen       
- ![](https://placehold.it/15/AFEEEE/000000?text=+) paleturquoise     
- ![](https://placehold.it/15/DB7093/000000?text=+) palevioletred     
- ![](https://placehold.it/15/FFEFD5/000000?text=+) papayawhip     
- ![](https://placehold.it/15/FFDAB9/000000?text=+) peachpuff      
- ![](https://placehold.it/15/CD853F/000000?text=+) peru             
- ![](https://placehold.it/15/FFC0CB/000000?text=+) pink          
- ![](https://placehold.it/15/DDA0DD/000000?text=+) plum              
- ![](https://placehold.it/15/B0E0E6/000000?text=+) powderblue       
- ![](https://placehold.it/15/800080/000000?text=+) purple            
- ![](https://placehold.it/15/663399/000000?text=+) rebeccapurple  
- ![](https://placehold.it/15/FF0000/000000?text=+) red      
- ![](https://placehold.it/15/BC8F8F/000000?text=+) rosybrown         
- ![](https://placehold.it/15/4169E1/000000?text=+) royalblue         
- ![](https://placehold.it/15/8B4513/000000?text=+) saddlebrown       
- ![](https://placehold.it/15/FA8072/000000?text=+) salmon           
- ![](https://placehold.it/15/F4A460/000000?text=+) sandybrown        
- ![](https://placehold.it/15/2E8B57/000000?text=+) seagreen          
- ![](https://placehold.it/15/FFF5EE/000000?text=+) seashell       
- ![](https://placehold.it/15/A0522D/000000?text=+) sienna            
- ![](https://placehold.it/15/C0C0C0/000000?text=+) silver            
- ![](https://placehold.it/15/87CEEB/000000?text=+) skyblue           
- ![](https://placehold.it/15/6A5ACD/000000?text=+) slateblue        
- ![](https://placehold.it/15/708090/000000?text=+) slategray        
- ![](https://placehold.it/15/FFFAFA/000000?text=+) snow           
- ![](https://placehold.it/15/00FF7F/000000?text=+) springgreen
- ![](https://placehold.it/15/4682B4/000000?text=+) steelblue         
- ![](https://placehold.it/15/D2B48C/000000?text=+) tan               
- ![](https://placehold.it/15/008080/000000?text=+) teal         
- ![](https://placehold.it/15/D8BFD8/000000?text=+) thistle           
- ![](https://placehold.it/15/FF6347/000000?text=+) tomato         
- ![](https://placehold.it/15/40E0D0/000000?text=+) turquoise         
- ![](https://placehold.it/15/EE82EE/000000?text=+) violet              
- ![](https://placehold.it/15/F5DEB3/000000?text=+) wheat            
- ![](https://placehold.it/15/FFFFFF/000000?text=+) white    
- ![](https://placehold.it/15/F5F5F5/000000?text=+) whitesmoke        
- ![](https://placehold.it/15/FFFF00/000000?text=+) yellow   
- ![](https://placehold.it/15/9ACD32/000000?text=+) yellowgreen

---
### Name:
Title of the instanced node as String

*Usage:*
> `name: "<String>"`

---
### Path:
Relative file path of the tile to be created

*Usage:*
> `path: "<String>"`

**Available Paths**:

    Player              = res://Prefab/Player/Player.tscn
    Crate               = res://Prefab/Object/Crate.tscn
    Hole                = res://Prefab/Object/Hole.tscn
    Sunken Crate        = res://Prefab/Object/SunkenCrate.tscn
    Wall                = res://Prefab/Object/Wall.tscn
    Basic Button        = res://Prefab/UI/BaseButton.tscn
    Continue Button     = res://Prefab/UI/ContinueTile.tscn
    Level Select Button = res://Prefab/UI/LevelSelectTile.tscn
    Level Button        = res://Prefab/UI/LevelTile.tscn
    Main Menu Button    = res://Prefab/UI/MainMenuTile.tscn
    Options Button      = res://Prefab/UI/OptionsTile.tscn
    Quests Button       = res://Prefab/UI/QuestsTile.tscn
    Restart Button      = res://Prefab/UI/RestartTile.tscn
    Start Button        = res://Prefab/UI/StartTile.tscn

---
### Font Size

Size of the text on a tile

*Usage:*
> `fontSize: <Int>`

---
### Id:

Number to assign indiviual players

*Usage:*
> `id: <Int>`

---
### Level:

Which level to transport the player to

*Usage:*
> `level: <Int>`

---
### Offset X

Horizontal position offset for the texture of the tile

*Usage:*
> `offsetX: <Int>`

---
### Offset Y

Vertical position offset for the texture of the tile

*Usage:*
> `offsetY: <Int>`
---
### Type:

Defines how the tile will be treated in-game

*Usage:* 
> `type: <Int>`

**Available Types:**

    PLAYER          = -2
    OPEN            = -1
    WALL            = 0
    CRATE           = 1 
    HOLE            = 2
    CONTINUE        = 3
    LEVEL_SELECT    = 4
    QUIT            = 5
    MAIN_MENU       = 6 
    START           = 7
    RESTART         = 8
    OPTIONS         = 9
    QUESTS          = 10
    LEVEL           = 11

---
### X:

Horizontal position on the grid

*Usage:*
> `X: <Int>`

---
### Y:

Vertical position on the grid

*Usage:*
> `Y: <Int>`

---
