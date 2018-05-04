
// Copyright Stephen Morrisson 2018
// All rights reserved

module myCube(c, xO, yO, zO, xS, yS, zS)
{
    color(c)
    translate([xO, yO, zO])
    cube([xS, yS, zS]);
}



// {xyz, rot, trans, tr} Cube

module xyzCube(c, x, y, z)
{
    color(c) cube([x, y, z], false);
}

module rotCube(c, rotX, rotY, rotZ, x, y, z)
{
    rotate([rotX, rotY, rotZ]) xyzCube(c, x, y, z);
}
translate([-15, 15, 0,])rotCube("green", 45, 45, 45, 2,2,2);

module transCube(c, xOffset, yOffset, zOffset, x, y, z)
{
    translate([xOffset, yOffset, zOffset]) xyzCube(c, x, y, z);
}
transCube("brown", -15, -15, 0, 3, 2, 1);


module trCube(c, rotX, rotY, rotZ, xO, yO, zO, x, y, z)
{
    translate([xO, yO, zO])
    rotate([rotX, rotY, rotZ])
    xyzCube(c, x, y, z);
}
//trCube("yellow", 0,0,0, 0,0,0, 2, 3, 4);
//trCube("green", 45, 45, 45, 4, 3, 1, 5, 6, 7);
//trCube("blue", 0, 0, 45, 20, 0, 0, 5, 6, 7);
trCube("orange", 0,0,0, -10, 0, 0, 1,1,1);
//trCube("orange", 45,0,0, -15, 0, 0, 1,1,1);
//trCube("orange", 0,45,0, -20, 0, 0, 1,1,1);
//trCube("orange", 0,0,45, -25, 0, 0, 1,1,1);

