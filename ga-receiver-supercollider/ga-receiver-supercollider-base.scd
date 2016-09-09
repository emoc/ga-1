/*

steps : 
	1. start server,
	2. load buffer if necessary
	3. start OSC listeners
	4. start synths
*/


// load sound the buffer

b = Buffer.read(s, "H:\\SONS\\SETS\\eau_qui_bout_extrait_mono.wav", bufnum:0); 

// start OSC listeners *********************

(
~mode = 0;
~params = Array.fill(16, {0});

h = NetAddr.new("127.0.0.1", 57120);
o = OSCresponder.new(nil, "/mode", { 
	arg time, resp, msg; 
	msg.postln; 
	~mode = msg[1];
	} 
).add; 

p  = OSCresponder.new(nil, "/params", { 
	arg time, resp, msg; 
	msg.postln; 
	~params[0] = msg[1];
	~params[1] = msg[2];
	~params[2] = msg[3];
	~params[3] = msg[4];
	~params[4] = msg[5];
	~params[5] = msg[6];
	~params[6] = msg[7];
	~params[7] = msg[8];
	~params[8] = msg[9];
	~params[9] = msg[10];
	~params[10] = msg[11];
	~params[11] = msg[12];
	~params[12] = msg[13];
	~params[13] = msg[14];
	~params[14] = msg[15];
	~params[15] = msg[16];

	switch(~mode,
		0,{	"mode 0".postln; 
			~params.postln;
			a = Synth("Mode0", [ \p0, ~params[0], \p1, ~params[1], \p2, ~params[2], \p3, ~params[3],
						\p4, ~params[4], \p5, ~params[5], \p6, ~params[6], \p7, ~params[7],
						\p8, ~params[8], \p9, ~params[9], \p10, ~params[10], \p11, ~params[11],
						\p12, ~params[12], \p13, ~params[13],\p14, ~params[14],\p15, ~params[15]]);
		},

		1,{	"mode 1".postln; 
			~params.postln;
			a = Synth("Mode1", [ \p0, ~params[0], \p1, ~params[1], \p2, ~params[2], \p3, ~params[3],
						\p4, ~params[4], \p5, ~params[5], \p6, ~params[6], \p7, ~params[7],
						\p8, ~params[8], \p9, ~params[9], \p10, ~params[10], \p11, ~params[11],
						\p12, ~params[12], \p13, ~params[13],\p14, ~params[14],\p15, ~params[15]]);
		},
		
		2,{	"mode 2".postln; 
			~params.postln;
			a = Synth("Mode2", [ \p0, ~params[0], \p1, ~params[1], \p2, ~params[2], \p3, ~params[3],
						\p4, ~params[4], \p5, ~params[5], \p6, ~params[6], \p7, ~params[7],
						\p8, ~params[8], \p9, ~params[9], \p10, ~params[10], \p11, ~params[11],
						\p12, ~params[12], \p13, ~params[13],\p14, ~params[14],\p15, ~params[15]]);
		},

		3,{	"mode 3".postln; 
			~params.postln;
			a = Synth("Mode3", [ \p0, ~params[0], \p1, ~params[1], \p2, ~params[2], \p3, ~params[3],
						\p4, ~params[4], \p5, ~params[5], \p6, ~params[6], \p7, ~params[7],
						\p8, ~params[8], \p9, ~params[9], \p10, ~params[10], \p11, ~params[11],
						\p12, ~params[12], \p13, ~params[13],\p14, ~params[14],\p15, ~params[15]]);
		},

		4,{	"mode 4".postln; 
			~params.postln;
			a = Synth("Mode4", [ \p0, ~params[0], \p1, ~params[1], \p2, ~params[2], \p3, ~params[3],
						\p4, ~params[4], \p5, ~params[5], \p6, ~params[6], \p7, ~params[7],
						\p8, ~params[8], \p9, ~params[9], \p10, ~params[10], \p11, ~params[11],
						\p12, ~params[12], \p13, ~params[13],\p14, ~params[14],\p15, ~params[15]]);
		},

		5,{	"mode 5".postln; 
			~params.postln;
			a = Synth("Mode5", [ \p0, ~params[0], \p1, ~params[1], \p2, ~params[2], \p3, ~params[3],
						\p4, ~params[4], \p5, ~params[5], \p6, ~params[6], \p7, ~params[7],
						\p8, ~params[8], \p9, ~params[9], \p10, ~params[10], \p11, ~params[11],
						\p12, ~params[12], \p13, ~params[13],\p14, ~params[14],\p15, ~params[15]]);
		},

		6,{	"mode 6".postln; 
			~params.postln;
			a = Synth("Mode6", [ \p0, ~params[0], \p1, ~params[1], \p2, ~params[2], \p3, ~params[3],
						\p4, ~params[4], \p5, ~params[5], \p6, ~params[6], \p7, ~params[7],
						\p8, ~params[8], \p9, ~params[9], \p10, ~params[10], \p11, ~params[11],
						\p12, ~params[12], \p13, ~params[13],\p14, ~params[14],\p15, ~params[15]]);
		},

		7,{	"mode 7".postln; 
			~params.postln;
			a = Synth("Mode7", [ \p0, ~params[0], \p1, ~params[1], \p2, ~params[2], \p3, ~params[3],
						\p4, ~params[4], \p5, ~params[5], \p6, ~params[6], \p7, ~params[7],
						\p8, ~params[8], \p9, ~params[9], \p10, ~params[10], \p11, ~params[11],
						\p12, ~params[12], \p13, ~params[13],\p14, ~params[14],\p15, ~params[15]]);
		},

		8,{	"mode 8".postln; 
			~params.postln;
			a = Synth("Mode8", [ \p0, ~params[0], \p1, ~params[1], \p2, ~params[2], \p3, ~params[3],
						\p4, ~params[4], \p5, ~params[5], \p6, ~params[6], \p7, ~params[7],
						\p8, ~params[8], \p9, ~params[9], \p10, ~params[10], \p11, ~params[11],
						\p12, ~params[12], \p13, ~params[13],\p14, ~params[14],\p15, ~params[15]]);
		},

		9,{	"mode 9".postln; 
			~params.postln;
			a = Synth("Mode9", [ \p0, ~params[0], \p1, ~params[1], \p2, ~params[2], \p3, ~params[3],
						\p4, ~params[4], \p5, ~params[5], \p6, ~params[6], \p7, ~params[7],
						\p8, ~params[8], \p9, ~params[9], \p10, ~params[10], \p11, ~params[11],
						\p12, ~params[12], \p13, ~params[13],\p14, ~params[14],\p15, ~params[15]]);
		}

	);

	} 
).add; 
)


// arreter les écouteurs OSC ***********************
(
o.remove;
p.remove;
)



// load synths ******************************************

(
	( 
	SynthDef("Mode0",{
		arg p0, p1, p2, p3, p4, p5, p6, p7, p8, p9, p10, p11, p12, p13, p14, p15, out = 0, bufnum = 0;
		var sound;
		sound = Linen.kr(Impulse.kr(0), 0.01, 0.6, 1.0, doneAction: 2) * SinOsc.ar(2000 * p0 + 50, 0, 0.1);
		Out.ar(out, sound);
	}).load(s);
	);

	( 
	SynthDef("Mode1",{
		arg p0, p1, p2, p3, p4, p5, p6, p7, p8, p9, p10, p11, p12, p13, p14, p15, out = 0, bufnum = 0;
		var sound;
		sound = Linen.kr(Impulse.kr(0), 0.01, 0.6, 1.0, doneAction: 2) * SinOsc.ar(2000 * p0 + 50, 0, 0.1);
		Out.ar(out, sound);
	}).load(s);
	);

	( 
	SynthDef("Mode2",{
		arg p0, p1, p2, p3, p4, p5, p6, p7, p8, p9, p10, p11, p12, p13, p14, p15, out = 0, bufnum = 0;
		var sound;
		sound = Linen.kr(Impulse.kr(0), 0.01, 0.6, 1.0, doneAction: 2) * SinOsc.ar(2000 * p0 + 50, 0, 0.1);
		Out.ar(out, sound);
	}).load(s);
	);

	( 
	SynthDef("Mode3",{
		arg p0, p1, p2, p3, p4, p5, p6, p7, p8, p9, p10, p11, p12, p13, p14, p15, out = 0, bufnum = 0;
		var sound;
		sound = Linen.kr(Impulse.kr(0), 0.01, 0.6, 1.0, doneAction: 2) * SinOsc.ar(2000 * p0 + 50, 0, 0.1);
		Out.ar(out, sound);
	}).load(s);
	);

	( 
	SynthDef("Mode4",{
		arg p0, p1, p2, p3, p4, p5, p6, p7, p8, p9, p10, p11, p12, p13, p14, p15, out = 0, bufnum = 0;
		var sound;
		sound = Linen.kr(Impulse.kr(0), 0.01, 0.6, 1.0, doneAction: 2) * SinOsc.ar(2000 * p0 + 50, 0, 0.1);
		Out.ar(out, sound);
	}).load(s);
	);

	( 
	SynthDef("Mode5",{
		arg p0, p1, p2, p3, p4, p5, p6, p7, p8, p9, p10, p11, p12, p13, p14, p15, out = 0, bufnum = 0;
		var sound;
		sound = Linen.kr(Impulse.kr(0), 0.01, 0.6, 1.0, doneAction: 2) * SinOsc.ar(2000 * p0 + 50, 0, 0.1);
		Out.ar(out, sound);
	}).load(s);
	);

	( 
	SynthDef("Mode6",{
		arg p0, p1, p2, p3, p4, p5, p6, p7, p8, p9, p10, p11, p12, p13, p14, p15, out = 0, bufnum = 0;
		var sound;
		sound = Linen.kr(Impulse.kr(0), 0.01, 0.6, 1.0, doneAction: 2) * SinOsc.ar(2000 * p0 + 50, 0, 0.1);
		Out.ar(out, sound);
	}).load(s);
	);

	( 
	SynthDef("Mode7",{
		arg p0, p1, p2, p3, p4, p5, p6, p7, p8, p9, p10, p11, p12, p13, p14, p15, out = 0, bufnum = 0;
		var sound;
		sound = Linen.kr(Impulse.kr(0), 0.01, 0.6, 1.0, doneAction: 2) * SinOsc.ar(2000 * p0 + 50, 0, 0.1);
		Out.ar(out, sound);
	}).load(s);
	);

	( 
	SynthDef("Mode8",{
		arg p0, p1, p2, p3, p4, p5, p6, p7, p8, p9, p10, p11, p12, p13, p14, p15, out = 0, bufnum = 0;
		var sound;
		sound = Linen.kr(Impulse.kr(0), 0.01, 0.6, 1.0, doneAction: 2) * SinOsc.ar(2000 * p0 + 50, 0, 0.1);
		Out.ar(out, sound);
	}).load(s);
	);

	( 
	SynthDef("Mode9",{
		arg p0, p1, p2, p3, p4, p5, p6, p7, p8, p9, p10, p11, p12, p13, p14, p15, out = 0, bufnum = 0;
		var sound;
		sound = Linen.kr(Impulse.kr(0), 0.01, 0.6, 1.0, doneAction: 2) * SinOsc.ar(2000 * p0 + 50, 0, 0.1);
		Out.ar(out, sound);
	}).load(s);
	);
)
  