import("stdfaust.lib");

overdrive = hgroup("[1]Overdrive",ba.bypass1(bpo, input_filter : clipping : post_filter * volume_control))
with{
    gain = hslider("[0]Gain[style:knob]", 0.5, 0, 1, 0.01) : si.smoo;
    tone = hslider("[1]Tone[style:knob]", 0.5, 0, 1, 0.01) : si.smoo;
    volume = hslider("[2]Volume[style:knob]", 0.8, 0, 1, 0.01) : si.smoo;

    input_filter = fi.highpass(1, 720);
    clipping = ef.cubicnl(gain, 0);
    post_filter = fi.lowpass(1, 350 + (tone * (4500 - 350)));
    volume_control = ba.db2linear((volume - 1) * 40);

    bpo = checkbox("[0]Bypass");
};

process = overdrive;