// Copyright Stephen Morrisson 2017
// All rights reserved

// rh Cent Cylinder
// rh Cylinder
use <myCube.scad>

module rhCentCylinder(c, rRadius, z)
{
    color(c) cylinder(h=z, r=rRadius, center=false);
}
translate([-15, -15, 0]) rhCentCylinder("red", 3, 2);

module rhCylinder(c, rRadius, z)
{
    translate([rRadius, rRadius, 0]) rhCentCylinder(c, rRadius, z);
}
translate([-15, 15, 0]) rhCylinder("blue", 2, 3);

module transCylinder(c, xO, yO, zO, rRadius, z)
{
    translate([xO, yO, zO]) rhCylinder(c, rRadius, z);
}
//transCylinder("red", 0,0,0, 4, 1);
transCylinder("green", 15, 15, 0, 2, 2);

module centRightCylinder(c, rRadius, z)
{
    rD = rRadius * 3.0;
    difference()
    {
        rhCentCylinder(c, rRadius, z);
        transCube(c, -rD, -rRadius, -rRadius,  rD, rD, rD);
    }
}
centRightCylinder("green", 2, 2);

module rightHalfCylinder(c, xO, yO, zO, rRadius, z)
{
    translate([xO, yO + rRadius, zO]) centRightCylinder(c, rRadius, z);
}
rightHalfCylinder("yellow", 10, 0, 0, 2, 1);

module leftHalfCylinder(c, xO, yO, zO, rRadius, z)
{
    translate([xO + rRadius, yO + rRadius, zO])
        rotate([0,0,180]) centRightCylinder(c, rRadius, z);
}
leftHalfCylinder("yellow", -10, 0, 0, 2, 1);

module topHalfCylinder(c, xO, yO, zO, rRadius, z)
{
    translate([xO + rRadius, yO, zO])
        rotate([0,0,90]) centRightCylinder(c, rRadius, z);
}
topHalfCylinder("yellow", 0, 10, 0, 2, 1);

module bottomHalfCylinder(c, xO, yO, zO, rRadius, z)
{
    translate([xO + rRadius, yO + rRadius, zO])
        rotate([0,0,270]) centRightCylinder(c, rRadius, z);
}
bottomHalfCylinder("yellow", 0, -10, 0, 2, 1);



