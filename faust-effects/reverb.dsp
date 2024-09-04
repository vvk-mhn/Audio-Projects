import("stdfaust.lib");

zita_light = hgroup("Reverb",(_,_ <: re.zita_rev1_stereo(rdel,f1,f2,t60dc,t60m,fsmax),_,_ : 
    out_eq,_,_ : dry_wet : out_level))
with{
    fsmax = 48000.0; 
    rdel = 60;    
    f1 = 200;
    t60dc = 3;
    t60m = 2;
    f2 = 6000;
    out_eq = pareq_stereo(eq1f,eq1l,eq1q) : pareq_stereo(eq2f,eq2l,eq2q);
    pareq_stereo(eqf,eql,Q) = fi.peak_eq_rm(eql,eqf,tpbt), fi.peak_eq_rm(eql,eqf,tpbt)
    with {
        tpbt = wcT/sqrt(max(0,g)); 
        wcT = 2*ma.PI*eqf/ma.SR;  
        g = ba.db2linear(eql); 
    };
    eq1f = 315;
    eq1l = 0;
    eq1q = 3;
    eq2f = 1500;
    eq2l = 0;
    eq2q = 3;
    dry_wet(x,y) = *(dry) + wet*x, *(dry) + wet*y 
    with {
        wet = 0.5*(drywet+1.0);
        dry = 1.0-wet;
    };
    drywet = vslider("[1] Dry/Wet Mix [style:knob]",
        0,-1.0,1.0,0.01) : si.smoo;
    gain = vslider("[2] Level [unit:dB] [style:knob]", -6, -70, 40, 0.1) : ba.db2linear : si.smoo;
    out_level = *(gain),*(gain);
};

process = zita_light;