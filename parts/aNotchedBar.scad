
// Copyright Stephen Morrisson 2018
// All rights reserved

use <aBlock.scad>

// NO notch offset from end
// NO notch size


// S refer to bar info
// NO Notch offset from low end,
// NS Notch size 


// oversize notch to remove false thin walls.
module aTopNotch(c, xS, yS, zS, xNO, xNS, zNS)
{
    tBlock(c, xNO, -1, zS - zNS, xNS, yS + 2, zNS + 1);
}

module aNotchedBar(c, xS, yS, zS, xNO, xNS, zNS)
{
    difference()
    {
        aBlock(c, xS, yS, zS);
	aTopNotch(c, xS, yS, zS, xNO, xNS, zNS);
    }
}

module aTop2NotchedBar(c, xS, yS, zS, xNO, xNS, zNS)
{
    difference()
    {
	aNotchedBar(c, xS, yS, zS, xNO, xNS, zNS);
	aTopNotch(c, xS, yS, zS, xS - xNS - xNO, xNS, zNS);
    }
}


module tNotchedBar(c, xO, yO, zO, xS, yS, zS,
                        xNO, xNS, zNS)
{
    translate([xO,yO,zO])
	aNotchedBar(c, xS, yS, zS, xNO, xNS, zNS);
}

module tTop2Notchedbar(c, xO, yO, zO,
            xS, yS, zS, xNO, xNS, zNS)
{
    translate([xO, yO, zO])
        aTop2NotchedBar(c, xS, yS, zS, xNO, xNS, zNS);
}



//aNotchedBar("green", 10,3,2,  2,1,1);
//tNotchedBar("green", 0,10,0, 5,3,2,  2,1,1);
//aTop2NotchedBar("green", 10,3,2,  2,1,1);
tTop2Notchedbar("green", 2,3,4, 10,3,2,  2,1,1);