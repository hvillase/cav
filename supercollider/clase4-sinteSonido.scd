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

// Sintetizador de sonido
(
SynthDef(\sonido1, {||
	var sonido, env, pan;
	sonido=PlayBuf.ar();
	env=EnvGen(Env());
	pan=Pan2,ar();
	Out,ar(0)
}).add
)

// Secuencia patrón
// variable global
// play, quant, stop

// Patrones
pseq
pn
prand
pshuffle
Librería de patrones