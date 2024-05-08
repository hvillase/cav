// conexión de dispositivo midi
s.boot;

MIDIIn.connectAll; // activa controladores MIDI

// Para ver los deslizadors y pots de tu controlador
(
MIDIIn.control={|src, chan,num,val|
	[src,chan,num,val].postln}
);

// Para ver los botones de tu controlador
(
MIDIIn.noteOn={|src, chan,num,val|
	[src,chan,num,val].postln}
);

// SYNTHS
(
SynthDef(\sawg,{|freq=300, a2g=0.2, p2g=0, at2g=0.1, r2g=0.2, gate=1, o2g=0|
var sen, env;
sen = Saw.ar(freq, a2g);
sen = Pan2.ar(sen, p2g);
env = EnvGen.kr(Env.asr(at2g, a2g, r2g), gate, doneAction: 2); //doneAction:0, gate 0, para control midi. donaAction:2, gate, 1 para mono
Out.ar(o2g, sen * env)
}).add
);

~c1sint = Synth(\sawg); // declaro mi sinte

// un switch para acomodar los botones o perillas y asignar la accion que quieras
(
MIDIIn.control={|src, chan, num, val|
                  switch(num,
		23,{if(val==127, {~c1sint.set(\gate,1)}, {~c1sint.set(\gate, 0)})}, // boton 23
		2,{~c1sint.set(\a2g, val.linlin(0,127,0,1))}, // deslizador 2 amp
		3,{~c1sint.set(\freq,val.linexp(0,127,50,12000))} // deslizador 3 frecuencia
	)}
);



