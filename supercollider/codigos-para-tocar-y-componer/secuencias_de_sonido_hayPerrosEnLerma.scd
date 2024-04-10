//==================================
// Secuencias para sintes de sonido
//==================================

// Instrucciones:
// 1 primero declara los buffers y synthdefs del documento sintes_de_sonido.scd
// 2 declara el Pdef
// 3 declara play
// 4 modifica los valores del Pdef y declara al vuelo para hacer live coding

// establece el tempo de la pieza. 60/120 equivale a un tempo 0 bpm de 120
TempoClock.tempo=60/120;

(
(
~son1 = Pdef(\son1, Pbind(\instrument, \audio1,
	\dur, Pseq([1/16], inf),
	\sus, Pseq([0.2, 0.4, 0.1, 0.1], inf),
	\rel, Pseq([0.1, 0.2, 0.5, 0.5], inf),
	\rate, Pseq([-36, -34, -32, -31, -36, -34, -34, -24].midicps, inf),
	\sp, Pseq([0, 0.7, 0.1, 0.9].mirror, inf),
	\amp, 0.6
))
);

(
~son2 = Pdef(\son2, Pbind(\instrument, \audio2,
	\dur, Pseq([0.25, 0.125, 0.125], inf),
	\sus, Pseq([0.04, 0.02], inf),
	\rel, Pseq([0.2, 0.1, 0.01, 0.4], inf),
	\rate, Pseq([4], inf),
	\sp, Pseq([0.1, 0.5, 0.75, 0.1, Pn(0.2, 4)], inf),
	\amp, 0.8
))
);

(
~son3 = Pdef(\son3, Pbind(\instrument, \audio3,
	\dur, Pseq([0.25, 0.125, 0.125, Pn(1/16, 4)], inf),
	\sus, Pseq([0.4, 0.02], inf),
	\rel, Pseq([0.2, 0.4], inf),
	\rate, Pseq([1, 1.5, 1.5], inf),
	\sp, Pseq([0.1, 0.5, 0.1, 0.1, Pn(0.2, 4), 1], inf),
	\amp, 0.8
))
);

(
~son4 = Pdef(\son4, Pbind(\instrument, \audio4,
	\dur, Pseq([0.25, 0.125, 0.125, Pn(1/16, 4)], inf),
	\sus, Pseq([0.4, 0.02], inf),
	\rel, Pseq([0.2, 0.4], inf),
	\rate, Pseq([1, 1.5, 1.5], inf),
	\sp, Pseq([0.1, 0.5, 0.1, 0.1, Pn(0.2, 4), 1], inf),
	\amp, 0.7
))
);

(
~son5 = Pdef(\son5, Pbind(\instrument, \audio5,
	\dur, Pseq([1/4], inf),
	\sus, Pseq([0.4, 0.02], inf),
	\rel, Pseq([0.2, 0.4], inf),
	\rate, Pseq([1.2], inf),
	\sp, Pseq([1, 0], inf),
	\amp, 0.8
))
);

(
~son6 = Pdef(\son6, Pbind(\instrument, \audio6,
	\dur, Pseq([1/4], inf),
	\sus, Pseq([0.4, 0.02], inf),
	\rel, Pseq([0.2, 0.4], inf),
	\rate, Pseq([1], inf),
	\sp, 0,
	\amp, 0.9
))
);
);

~son1.play.quant(4);
~son1.stop;
~son2.play.quant(4);
~son2.stop;
~son3.play.quant(4);
~son3.stop;
~son4.play.quant(4);
~son4.stop;
~son5.play.quant(4);
~son5.stop;
~son6.play.quant(4);
~son6.stop;


s.quit; // APAGA supercollider