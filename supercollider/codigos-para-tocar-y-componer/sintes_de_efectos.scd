// Procesamiento de sonido

// --- Reverberación - bus 9
(
(
SynthDef(\rev, {|in = 9, mix = 0.4, room = 0.9, damp = 0.1, amp = 1, gate = 1, out = 0|
	var sen, env;
	sen = FreeVerb.ar(InFeedback.ar(in, 2), mix, room, damp, amp);
	env = EnvGen.kr(Env.asr(0.01, 1, 0.1), gate, doneAction: 0);
	Out.ar(out, sen * env);
}).add
);

// --- Delay - bus 11, mdt = maxdelayTime, dt = delayTime, dct = decayTime
(
SynthDef(\del, {|in = 11, mdt = 0.3, dt = 0.25, dct = 2, gate = 1, out = 0|
var del, env;
	del = CombL.ar(InFeedback.ar(in, 2), mdt, dt, dct);
	env = EnvGen.kr(Env.asr(0.01, 1, 0.01), gate, doneAction: 0);
	Out.ar(out, del * env);
}).add
);
);

// Activar efectos
(
~rev=Synth(\rev); // 9 Reverberación
~del=Synth(\del); // 11 Delay
);

// Modificación de efectos
~rev.set(\mix, 0.5, \room, 0.5, \damp, 0.5);
~del.set(\mdt, 0.5, \dt, 0.25, \dct, 3);












