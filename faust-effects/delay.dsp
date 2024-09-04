import("stdfaust.lib");

delay = hgroup("[1]Delay",ba.bypass1(bpdelay,ef.echo(2,delayTime,delayFb)))
with{
  delayTime = hslider("[0]Time[style:knob]",0.3,0,2,0.01);
  delayFb = hslider("[1]Feedback[style:knob]",0.5,0,1,0.01);
  bpdelay = checkbox("[2]Bypass");
};

process = delay;
