// Clase 4
// El sintetizador de sonido

// Prendemos supercollider
s.boot;

// Cargar sonido en Buffer
b = Buffer.read(s, "/home/hernani/cav/sonidos/perc2-mono.wav");

// Ruta Mac
//"/Users/name/Desktop/folder/sonido2.wav"

// Ruta Windows
// desde c:

// Reproducir sonido MONO con PlayBuf
// El 1 indica que es sonido de un solo canal o MONO, estéreo se cambia a 2
{PlayBuf.ar(1, b.bufnum, rate: 1, trigger: 1.0, startPos: 0.0, loop: 0, doneAction:2)}.play

// Sintetizador de sonido MONO
(
SynthDef(\sonido1, {|rate=1, sp=0, pan=0, amp=1, at=0.001, sus=1, rel|
	var sonido, hpf, env, paneo;
	sonido=PlayBuf.ar(1, b.bufnum, rate, 1, sp * b.numFrames, 0);
	hpf=HPF.ar(sonido, 20);
	paneo=Pan2.ar(hpf, pan, amp);
	env=EnvGen.ar(Env([0,1,1,0], [at, sus * b.duration, rel]), doneAction:2);
	Out.ar(0, paneo * env)
}).add;
)

Synth(\sonido1, [\rate, 1]);

// Secuencia patrón
// variable global
// play, quant, stop

// Patrones
pseq
pn
prand
pshuffle
Librería de patrones