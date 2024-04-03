//====================
// SynthDefs de audio
//====================

// Notas:
// Necesitas colocar tus sonidos en una carpeta y organizarlos en mono y estéreo
// Sonidos cortos funcionan bien, entre 1 y 10 segundos. Pueden ser más largos.

// Instrucciones:
// 1 prender supercollider con s.boot
// 2 carga un sonido en un Buffer
// 3 coloca la ruta de tu sonido
// 4 declara los Buffers
// 5 declara los Synthes
// 6 abre el documento de secuencias de sonido para tocar o componer

s.boot;

// Ruta en Linux
b = Buffer.read(s, "/home/hernani/cav/sonidos/git1-mono.wav");
c = Buffer.read(s, "/home/hernani/cav/sonidos/perc1-st.wav");
d = Buffer.read(s, "/home/hernani/cav/sonidos/perc2-mono.wav");

// Ruta en Mac
// b = Buffer.read(s, "/Users/name/Desktop/folder/sonido2.wav");

// Ruta en Windows, nota la letra C. Debes voltear las diagonales pues windows las pone al revés \
// b = Buffer.read(s, "C:/Users/name/Desktop/folder/sonido2.wav");

// SynthDef Mono. Es ideal para hacer mover el sonido entre bocinas con pan.
(
SynthDef(\audio1, {|rate=1, sp=0, at=0.001, sus=1, rel=0.001, pan=0, amp=1, out=0|
					var son, hpf, paneo, env;
					son=PlayBuf.ar(1, b.bufnum, rate, 1, sp * b.numFrames, 0);
					hpf=HPF.ar(son, 20);
					paneo=Pan2.ar(hpf, pan, amp);
					env=EnvGen.kr(Env.new([0, 1, 1, 0], [at, sus * b.duration, rel]), doneAction: 2);
					Out.ar(out, paneo * env);
				}).add;
);

// SynthDef Estéreo. Es ideal para sonidos ambientales largos
(
SynthDef(\audio2, {|rate=1, sp=0, at=0.001, sus=1, rel=0.001, pan=0, amp=1, out=0|
					var son, hpf, paneo, env;
					son=PlayBuf.ar(2, c.bufnum, rate, 1, sp * c.numFrames, 0);
					hpf=HPF.ar(son, 20);
					paneo=Pan2.ar(hpf, pan, amp);
					env=EnvGen.kr(Env.new([0, 1, 1, 0], [at, sus * c.duration, rel]), doneAction: 2);
					Out.ar(out, paneo * env);
				}).add;
);

Synth(\audio1);
Synth(\audio2);

s.quit;