import("stdfaust.lib");

phaser = hgroup("[0]Phaser",ba.bypass1(bpp,pf.phaser2_mono(2,0,width,frqmin,fratio,frqmax,speed,depth,fb,invert)))
with{
    width = hslider("[1]Width[style:knob]", 100, 10, 1000, 1);
    frqmin = hslider("[2]Min Frequency[style:knob]", 300, 20, 5000, 1);
    fratio = hslider("[3]Frequency Ratio[style:knob]", 1.2, 1.0, 2.0, 0.01);
    frqmax = hslider("[4]Max Frequency[style:knob]", 2000, 100, 10000, 1);
    speed = hslider("[5]Speed[style:knob]", 0.5, 0.01, 10, 0.01);
    depth = hslider("[6]Depth[style:knob]", 1, 0, 2, 0.01) : si.smoo;
    fb = hslider("[7]Feedback[style:knob]", 0.5, 0, 0.95, 0.01);
    invert = vslider("[8]Invert[style:knob]", 0, 0, 1, 1);
    bpp = checkbox("[0]Bypass");
};

process = phaser;