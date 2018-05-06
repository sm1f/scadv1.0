
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
    tBlock(c, [xNO, -1, zS - zNS], [xNS, yS + 2, zNS + 1]);
}

module bTopNotch(c, Size, xNO, xNS, zNS)
{
    aTopNotch(c, Size[0], Size[1], Size[2], xNO, xNS, zNS);
}

module tNotchedBar(c, Offset, Size, xNO, xNS, zNS)
{
    
}


module aNotchedBar(c, xS, yS, zS, xNO, xNS, zNS)
{
    difference()
    {
        aBlock(c, xS, yS, zS);
	aTopNotch(c, xS, yS, zS, xNO, xNS, zNS);
    }
}
module bNotchedBar(c, Size, xNO, xNS, zNS)
{
   aNotchedBar(c, Size[0], Size[1], Size[2], xNO, xNS, zNS);
}


module bTop2NotchedBar(c, Size, xNO, xNS, zNS)
{
    difference()
    {
	bNotchedBar(c, Size, xNO, xNS, zNS);
	bTopNotch(c, Size, xS - xNS - xNO, xNS, zNS);
    }
}


module tNotchedBar(c, Offset, Size, xNO, xNS, zNS)
{
    translate(Offset)
	bNotchedBar(c, Size, xNO, xNS, zNS);
}

module tTop2NotchedBar(c, Offset, Size, xNO, xNS, zNS)
{
    translate(Offset)
        bTop2NotchedBar(c, Size, xNO, xNS, zNS);
}

module TestNotchBar()
{
    Sz = [10, 4, 3];
    tTop2NotchedBar("yellow", [10, 0, 0], Sz, 3, 2, 2);
}
TestNotchBar();
