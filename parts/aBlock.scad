
// Copyright Stephen Morrisson 2018
// All rights reserved

module aBlock(c, xS, yS, zS)
{
    color(c)
        cube([xS, yS, zS]);
}
//aBlock("red", 10,5,2);

module bBlock(c, Size)
{
    aBlock(c, Size[0], Size[1], Size[2]);
}
//bBlock("yellow", [9,5,3]);


module tBlock(c, Offset, Size)
{
    translate(Offset)
        bBlock(c, Size);
}
//tBlock("blue", [1,2,3], [10,1,5]);


module rBlock(c, Rot, Size)
{
    rotate(Rot)
        bBlock(c, Size);
}

module trBlock(c, Trans, Rot, Size)
{
    color(c)
    translate(Trans)
       rBlock(c, Rot, Size);
}



module testBlocks()
{
    Sz = [8, 4, 1];

    trBlock("orange", [20,0,0],  [0,0,0], Sz);
    trBlock("blue", [10, -10, 0], [0, 90, 0], Sz);
    trBlock("gray", [-10, 10, 0], [0,0,90], Sz);
    trBlock("yellow", [0,0,0], [90,0,0], Sz);
    trBlock("green", [-20,-20,0], [90,270,45], Sz);
}

testBlocks();


