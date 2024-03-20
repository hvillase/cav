// Clase 2 de supercollider
s.boot; // prender
s.scope; // osciloscopio

// SynthDef sin envolvente
(
SynthDef(\misinte,{|freq=880, amp=0.5, rel=0.07|
var sonido, env;
	sonido=SinOsc.ar(freq,0,amp);
	env= EnvGen.ar(Env([0,1,0],[0.01,rel]),doneAction:2);
	Out.ar(0, sonido)
}).add
)

// forma de llamar un synth
a=Synth(\misinte); // prendo
a.set(\amp, 0.9); // cambio un parámetro
a.free; // libero el synth
(
Pdef(\seq, Pbind(\instrument, \misinte,
	\dur, Pseq([0.25, 0.25,0.5],inf),
	\note, Pseq([20, 26, 27],inf),
	\amp, 0.5,
	\rel, Pseq([0.01,0.01,0.1],inf))).stop
)

// envolvente
Env([0,1,1,0],[0.1,1,0.1]).plot

// formas de onda
{SinOsc.ar(840,0,0.5)}.play

{LFTri.ar(140,0,0.9)}.play

{Pulse.ar(140,0.5,0.9)}.play

{Saw.ar(140,0.5)}.play

{WhiteNoise.ar(0.5)}.play

{PinkNoise.ar(0.5)}.play