
// Copyright Stephen Morrisson 2018
// All rights reserved


use <aBlock.scad>

// S size of bar
// T size of tenon (after removing stuff)
// B bottom removed size
// T Top Removed size
// L left removed size
// R right removed size

module bTenon1(c, S)
{
   aBlock(c, S);
}

aTenon1(c, [16, 7, 5]);



module aTenonBar1End(c, xS, yS, zS, xT, yT, zT)
{
    cTenonBar1End(c,c, xS, yS, zS, xT, yT, zT);
}

module cTenonBar1End(c1, c2, xS, yS, zS, xT, yT, zT)
{
      difference()
    {
        aBlock(c1, xS, yS, zS);
        aNegitiveTenon(c2, xS, yS, zS, xT, yT, zT, 0.0);
    }  
}

module aTenonBar2Ends(c, xS, yS, zS, xT1, yT1, zT1,
            xT2, yT2, zT2)
{
}

module aTenonBarSameBothEnds(c, xS, yS, zS, xT, yT, zT)
{
}

module aNegitiveTenon(c, xS, yS, zS, xT, yT, zT, xO)
{
    aBlock(c, 1,1,1);
}


//cTenonBar1End("yellow", "green", 26,7,5,  3,2,1);
