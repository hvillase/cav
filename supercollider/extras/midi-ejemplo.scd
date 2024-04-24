
MIDIIn.connectAll; // activa controladores MIDI

(// Para ver los deslizadors y pots de tu controlador
MIDIIn.control={|src, chan,num,val|
	[src,chan,num,val].postln}
);

(// Para ver los botones de tu controlador
MIDIIn.noteOn={|src, chan,num,val|
	[src,chan,num,val].postln}
);

(// un switch para acomodar los botones o perillas y asignar la accion que quieras
MIDIIn.control={|src, chan, num, val|
                  switch(num,23,{if(val==127, {~c1sint.set(\gate,1)}, {~c1sint.set(\gate, 0)})}, // boton
		25, {if(val==127,{~b2sint = Synth(\b2play,[\ab2, 10, \sb2, 5])}, {"nada".postln})}, // boton
		2,{~c1sint.set(\a2g, val.linlin(0,127,0,1))}, // deslizador
		3,{~c1sint.set(\freq,val.linexp(0,127,50,12000))}, // deslizador
		4,{~b2sint.set(\rate,val.linlin(0,127,0.5,2.5))}) // deslizador
                         }
);