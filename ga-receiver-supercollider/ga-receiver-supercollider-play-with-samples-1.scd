/*

steps : 
	1. start server,
	2. load buffer if necessary
	3. start OSC listeners
	4. start synths
*/


// load a mono sound into the buffer

b = Buffer.read(s, "H:\\SONS\\SETS\\pluck_mono.wav", bufnum:0); 
b = Buffer.read(s, "H:\\SONS\\SETS\\mouche_mono.wav", bufnum:0);
b = Buffer.read(s, "H:\\SONS\\SETS\\plonk_mono.wav", bufnum:0);
b = Buffer.read(s, "H:\\SONS\\SETS\\cisailles_1_mono.wav", bufnum:0);
b = Buffer.read(s, "H:\\SONS\\SETS\\cisailles_2_mono.wav", bufnum:0);
b = Buffer.read(s, "H:\\SONS\\SETS\\francois_de_roubaix_crapaud_electronique_mono.wav", bufnum:0);

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
	(  /* play a part of the sample at variable speed */
	SynthDef("Mode0",{
		arg p0, p1, p2, p3, p4, p5, p6, p7, p8, p9, p10, p11, p12, p13, p14, p15, bufnum = 0;
		var sound, length, start, envel;

		start = b.numFrames * p0;
		length = (p1 * (b.numFrames - start)) / 44100;
		envel = Env.sine(dur: length, level: 1 );

		sound = PlayBuf.ar(numChannels:1, bufnum:0, startPos:start, rate: p2 * 20, doneAction:2);
		sound = sound * EnvGen.kr(envel);

		Out.ar([0, 1], sound);
	}).load(s);
	);

	(  /* play a reversed part of the sample */
	SynthDef("Mode1",{
		arg p0, p1, p2, p3, p4, p5, p6, p7, p8, p9, p10, p11, p12, p13, p14, p15, bufnum = 0;
		var sound, length, start, envel;

		start = b.numFrames * p0;
		length = (p1 * start) / 44100;
		envel = Env.sine(dur: length, level: 1 );

		sound = PlayBuf.ar(numChannels:1, bufnum:0, startPos:start, rate: -1, doneAction:2);
		sound = sound * EnvGen.kr(envel);

		Out.ar([0, 1], sound);
	}).load(s);
	);

	( /* play a reversed part of the sample at variable speed */
	SynthDef("Mode2",{
		arg p0, p1, p2, p3, p4, p5, p6, p7, p8, p9, p10, p11, p12, p13, p14, p15, bufnum = 0;
		var sound, length, start, envel;

		start = b.numFrames * p0;
		length = (p1 * start) / 44100;
		envel = Env.sine(dur: length, level: 1 );

		sound = PlayBuf.ar(numChannels:1, bufnum:0, startPos:start, rate: -20 * p2, doneAction:2);
		sound = sound * EnvGen.kr(envel);

		Out.ar([0, 1], sound);
	}).load(s);
	);

	( /* play a part of the sample pitch shifted */
	SynthDef("Mode3",{
		arg p0, p1, p2, p3, p4, p5, p6, p7, p8, p9, p10, p11, p12, p13, p14, p15, bufnum = 0;
		var sound, length, start, envel, linstart, linend, lintime, wsize;

		start = b.numFrames * p0;
		length = (p1 * (b.numFrames - start)) / 44100;
		envel = Env.sine(dur: length, level: 1 );

		linstart = p3 * 4.0;
		linend = p4 * 4.0;
		lintime = p5 * 400.0;
		wsize = p6 + 0.0002;

		sound = PlayBuf.ar(numChannels:1, bufnum:0, startPos:start, rate: p2 * 20, doneAction:2);
		sound = PitchShift.ar(sound, windowSize:wsize, pitchRatio:Line.kr(linstart, linend, lintime), pitchDispersion:0, timeDispersion:0);
		//sound = sound * EnvGen.kr(envel, doneAction:2);

		Out.ar([0, 1], sound);
	}).load(s);
	);

	( /* play a part of the sample pitch shifted (same than Mode3 with envelope!) */
	SynthDef("Mode4",{
		arg p0, p1, p2, p3, p4, p5, p6, p7, p8, p9, p10, p11, p12, p13, p14, p15, bufnum = 0;
		var sound, length, start, envel, linstart, linend, lintime, wsize;

		start = b.numFrames * p0;
		length = (p1 * (b.numFrames - start)) / 44100;
		envel = Env.sine(dur: length, level: 1 );

		linstart = p3 * 4.0;
		linend = p4 * 4.0;
		lintime = p5 * 400.0;
		wsize = p6 + 0.0002;

		sound = PlayBuf.ar(numChannels:1, bufnum:0, startPos:start, rate: p2 * 20, doneAction:2);
		sound = PitchShift.ar(sound, windowSize:wsize, pitchRatio:Line.kr(linstart, linend, lintime), pitchDispersion:0, timeDispersion:0);
		sound = sound * EnvGen.kr(envel, doneAction:2);

		Out.ar([0, 1], sound);
	}).load(s);
	);

	( /* play a part of the sample with FreqShift and envelope */
	SynthDef("Mode5",{
		arg p0, p1, p2, p3, p4, p5, p6, p7, p8, p9, p10, p11, p12, p13, p14, p15, bufnum = 0;
		var sound, length, start, envel;

		start = b.numFrames * p0;
		length = (p1 * (b.numFrames - start)) / 44100;
		envel = Env.sine(dur: length, level: 1 );



		sound = PlayBuf.ar(numChannels:1, bufnum:0, startPos:start, rate: p2 * 20, doneAction:2);
		FreqShift.ar(sound, freq: p0 * 5000, phase: p1 * 6.28);
		sound = sound * EnvGen.kr(envel, doneAction:2);

		Out.ar([0, 1], sound);
	}).load(s);
	);

	( /* some grains */
	SynthDef("Mode6",{
		arg p0, p1, p2, p3, p4, p5, p6, p7, p8, p9, p10, p11, p12, p13, p14, p15, bufnum = 0;
		var sound, length, envel;

		p0 = p0 * 4;
		p3 = p3 * 3000;
		length = p4 * 10;

		sound = TGrains.ar(2, trigger:SinOsc.ar(Line.kr(0, p3, length)), bufnum:0, rate:p0, centerPos:(p1 * b.numFrames / 44100).rand, dur:p2, amp:0.2, interp:4);
		envel = Env.sine(dur: length, level: 1 );
		sound = sound * EnvGen.kr(envel, doneAction:2);

		Out.ar([0, 1], sound);
	}).load(s);
	);

	( /* formlet filter over some part of the sample */
	SynthDef("Mode7",{
		arg p0, p1, p2, p3, p4, p5, p6, p7, p8, p9, p10, p11, p12, p13, p14, p15, out = 0, bufnum = 0;
		var sound, length, start, envel;

		start = b.numFrames * p0;
		length = (p1 * (b.numFrames - start)) / 44100;
		envel = Env.sine(dur: length, level: 0.4 );

		p3 = p3 * 2000;
		p4 = p4 * 2;
		p5 = length * 44100 - p4;

		sound = PlayBuf.ar(numChannels:1, bufnum:0, startPos:start, rate: p2 * 5, doneAction:2);
		sound = Formlet.ar(in: sound, freq:p3, attacktime:p4, decaytime:p5);
		sound = sound * EnvGen.kr(envel, doneAction:2);

		Out.ar([0, 1], sound);
	}).load(s);
	);

	( /* klank */
	SynthDef("Mode8",{
		arg p0, p1, p2, p3, p4, p5, p6, p7, p8, p9, p10, p11, p12, p13, p14, p15, out = 0, bufnum = 0;
		var sound, length, start, envel;

		start = b.numFrames * p0;
		length = (p1 * (b.numFrames - start)) / 44100;
		envel = Env.sine(dur: length, level: 0.2 );


		sound = PlayBuf.ar(numChannels:1, bufnum:0, startPos:start, rate: p2, doneAction:2);
		sound = Klank.ar(`[[p2*5000, p3*5000, p4*5000, p5*5000], [p6, p7, p8, p9], [p10, p11, p12, p13]], input: sound);
		sound = sound * EnvGen.kr(envel, doneAction:2);

		Out.ar([0, 1], sound);
	}).load(s);
	);

	( /* reverb */
	SynthDef("Mode9",{
		arg p0, p1, p2, p3, p4, p5, p6, p7, p8, p9, p10, p11, p12, p13, p14, p15, out = 0, bufnum = 0;
		var sound, length, start, envel;

		start = b.numFrames * p0;
		length = (p1 * (b.numFrames - start)) / 44100;
		envel = Env.sine(dur: length, level: 0.4 );


		sound = PlayBuf.ar(numChannels:1, bufnum:0, startPos:start, rate: p2 * 5, doneAction:2);
		sound = FreeVerb.ar(in: sound, mix: p3, room: p4, damp: p5);
		sound = sound * EnvGen.kr(envel, doneAction:2);

		Out.ar([0, 1], sound);
	}).load(s);
	);
)
          