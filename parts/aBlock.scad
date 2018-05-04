
// Copyright Stephen Morrisson 2018
// All rights reserved

module aBlock(c, xS, yS, zS)
{
    color(c)
        cube([xS, yS, zS]);
}


module tBlock(c, xO, yO, zO, xS, yS, zS)
{
    translate([xO, yO, zO])
        aBlock(c, xS, yS, zS);
}

module rBlock(c, rX, rY, rZ, xS, yS, zS)
{
    rotate([rX, rY, rZ])
        aBlock(c, xS, yS, zS);
}

module trBlock(c, xO, yO, zO, rX, rY, rZ, xS, yS, zS)
{
    color(c)
    translate([xO, yO, zO])
       rBlock(c, rX, rY, rZ, xS, yS, zS);
}

//aBlock("yellow", 1,2,3);
//tBlock("red", 10, 10, 10, 1, 2,3);
trBlock("orange", 20,0,0,  0,0,0, 8,4,1);
trBlock("blue", 10, -10, 0, 0, 90, 0, 8, 4, 1);
trBlock("gray", -10, 10, 0, 0,0,90, 8,4,1);
trBlock("yellow", 0,0,0, 90,0,0, 8,4,1);
trBlock("green", -10,-10,-10, 90,270,45, 8,4,1);
