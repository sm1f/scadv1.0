
// Copyright Stephen Morrisson 2018
// All rights reserved

use <Block.scad>

// Size: size of bar
// NO Notch offset from low end,
// NS Notch size 

// test stuff
tSize = [20,3,10];

module cBarNotched(c, Size, xNO, xNS, zNS)
{
    ccBarNotched(c,c,Size, xNO, xNS, zNS);
}
//cBarNotched("red", tSize, 2, 1, 1);

module cNotch(c, Size, xNO, xNS, zNS)
{
    yS = Size[1];
    zS = Size[2];
    tBlock(c, [xNO, -1, zS - zNS], [xNS, yS + 2, zNS + 1]);
}

module ccBarNotched(c1, c2, Size, xNO, xNS, zNS)
{
    difference()
    {
	cBlock(c1, Size);
	cNotch(c2, Size, xNO, xNS, zNS);
    }
}
//ccBarNotched("yellow", "red", tSize, 2, 3, 4);


module tBarNotched(c, Offset, Size, xNO, xNS, zNS)
{
    translate(Offset) ccBarNotched(c, "red", Size, xNO, xNS, zNS);
}
//tBarNotched("green", [-10,-10,-10], tSize, 2, 3, 4);
//tBarNotched("yellow", [0,0,0], tSize, 2, 3, 4);


module trBarNotched(c, Offset, Rot, Size, xNO, xNS, zNS)
{
    rotate(Offset) tBarNotched(c, Offset, Size, xNO, xNS, zNS);
}
//trBarNotched("blue", [0,0,0], [0,0,0], tSize, 2, 3, 4);


module trBarNotchedTwiceFromEnds(c, Offset, Rot, Size,
     xNO1, xNS1, zNS1, xNO2, xNS2, zNS2)
{
    xS = Size[0];
    translate(Offset) rotate(Rot)
    {
        difference()
	{
	    cBarNotched(c, Size, xNO1, xNS1, zNS1);
	    cNotch("red", Size, xS - xNO2 - xNS2, xNS2, zNS2);
        }
    }
}
//trBarNotchedTwiceFromEnds("yellow", [0,0,0], [0,0,45], tSize, 2,1,1, 3,2,2);

module trBarNotchedBoth(c, Offset, Rot, Size, xNO, xNS, zNS)
{
    trBarNotchedTwiceFromEnds(c, Offset, Rot, Size,
    				 xNO, xNS, zNS, xNO, xNS, zNS);
}
trBarNotchedBoth("blue", [0,0,0], [0,0,0], tSize, 2,1,1);