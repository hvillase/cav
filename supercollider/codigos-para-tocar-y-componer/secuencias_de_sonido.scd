//=================================
// Secuencias para sintes de sonido
//=================================

// Instrucciones:
// 1 primero declara los buffers y synthdefs del documento sintes_de_sonido.scd
// 2 declara el Pdef
// 3 declara play
// 4 modifica los valores del Pdef y declara al vuelo para hacer live coding

(
~son1 = Pdef(\son1, Pbind(\instrument, \audio1,
	\dur, Pseq([0.25, 0.125, 0.125], inf),
	\sus, Pseq([0.04, 0.02], inf),
	\rel, Pseq([0.2, 0.1, 0.01, 0.4], inf),
	\rate, Pseq([1, 1.5, 1, 1, 1.8], inf),
	\sp, Pseq([0.1, 0.5, 0.75, 0.1, Pn(0.2, 4)], inf),
	\amp, 0.6
))
);

(
~son2 = Pdef(\son2, Pbind(\instrument, \audio2,
	\dur, Pseq([0.25, 0.125, 0.125], inf),
	\sus, Pseq([0.04, 0.02], inf),
	\rel, Pseq([0.2, 0.1, 0.01, 0.4], inf),
	\rate, Pseq([1, 1.5, 1, 1, 1.8], inf),
	\sp, Pseq([0.1, 0.5, 0.75, 0.1, Pn(0.2, 4)], inf),
	\amp, 0.8
))
);

~son1.play.quant(4);
~son1.stop;
~son2.play.quant(4);
~son2.stop;

s.quit;