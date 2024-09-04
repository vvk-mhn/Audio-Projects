import("stdfaust.lib");

wah4 = ba.bypass1(bp, ve.wah4(fr))
with{
    wah4_group(x) = hgroup("Wah", x);
    bp = wah4_group(checkbox("[0] Bypass"));
    fr = wah4_group(hslider("[1] Resonance Frequency [scale:log]", 500,100,2000,1));
};

process = wah4;