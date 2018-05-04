
// Copyright Stephen Morrisson 2018
// All rights reserved

module aBlock(c, xO, yO, zO, xS, yS, zS)
{
    color(c)
    translate([xO, yO, zO])
    cube([xS, yS, zS]);
}

aBlock("red", 10, 10, 10, 1, 2,3);

module rBlock(c, rX, rY, rZ, xO, yO, zO, xS, yS, zS)
{
    color(c)
    translate([xO, yO, zO])
    rotate(rX, rY, rZ)
    cube([xS, yS, zS]);
}

rBlock("green", 90,0,0, 1   0,0,0, 8,2,1);
