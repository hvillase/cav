s.boot;

/// ayuda de sampltetexto
SampleTexto2.help;

// crea una instancia de sampletexto
~a=SampleTexto2.new;

//arrastra tu carpeta de sonidos depués de los dos puntos y declara la línea para cargar los sonidos
~a.init(path: "/home/hvillase/cav/sonidos");

// toca el sonido del índice cero
~a.st(6).play;

// separa los sonidos en mono y estéreo
~a.stsel;

// toca un sonido mono en el índice 0
~a.stm(0).play;

// toca un sonido estéreo en el índice 0
~a.sts(0).play;

// te da información de los sonidos de la carpeta
~a.info;

// crea un synth mono para cada sonido de la carpeta
~a.monosynth();

// crea un synth estéreo para cada sonido de la carpeta
~a.stereosynth();

// Prueba los syns creados con la palabra m0 para mono y s0 para estéreo
Synth(\m0);
Synth(\s0);

// Listo para secuenciar y procesar
TempoClock.tempo=(120/60)/4;
// -36 DO,
(
~s1=Pdef(\s1, Pbind(\instrument, \m0,
	\dur, 1/16,
	\rate, Pseq([-32, -30, -28, -27].pyramid, inf).midicps,
	\sp, Pseq([0.1, 0.2, 0.1, 0, Pn(0.15, 4)].mirror, inf),
	\amp, 0.6,
	\out, 0
))
);

~s1.play.quant(4)
~s1.stop;