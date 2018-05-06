
// Copyright Stephen Morrisson 2018
// All rights reserved


module cBlock(c, Size)
{
    color(c)
        cube(Size);
}
//cBlock("blue", [2,3,4]);

module tBlock(c, Offset, Size)
{
    translate(Offset) cBlock(c, Size);
}
//tBlock("green", [10,20,1], [2,4,6]);

module rBlock(c, Rot, Size)
{
    rotate(Rot) cBlock(c, Size);
}
//rBlock("blue", [45,90,135], [2,4,6]);

module trBlock(c, Offset, Rot, Size)
{
    translate(Offset) rBlock(c, Rot, Size);
}
//trBlock("blue", [1,2,3], [45,90,135], [2,4,6]);


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


