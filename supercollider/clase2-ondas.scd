// Clase 2 de supercollider
s.boot; // prender
s.scope; // osciloscopio

// SynthDef sin envolvente
(
SynthDef(\misinte,{|amp=0.5|
var sonido;
	sonido=SinOsc.ar(840,0,amp);
	Out.ar(0, sonido)
}).add
)

// forma de llamar un synth
a=Synth(\misinte); // prendo
a.set(\amp, 0.9); // cambio un parámetro
a.free; // libero el synth


// formas de onda
{SinOsc.ar(840,0,0.5)}.play

{LFTri.ar(140,0,0.9)}.play

{Pulse.ar(140,0.5,0.9)}.play

{Saw.ar(140,0.5)}.play

{WhiteNoise.ar(0.5)}.play

{PinkNoise.ar(0.5)}.play