
// Copyright Stephen Morrisson 2018
// All rights reserved

use <aBlock.scad>

// NO notch offset from end
// NO notch size
module aTopNotch(c, xS, yS, yS, xNO, xNS, zNS)
{
    aBlock(c, 
}

module aNotchedBar(c, xO, yO, zO, xS, yS, zS, xNO, xNS, zNS)
{
    translate([xO,yO,zO])
    difference()
    {
        aBlock(c, xO, yO, zO, xS, yS, zS);
    }
}

aNotchedBar("green", 0,0,0, 20,3,2,  2,1,1);
