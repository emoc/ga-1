
/*
    TODO : 
    utiliser Machine.add (avec args) plutot que spork~ 
    mais prob. de chemin de fichier sous windows...
*/

OscRecv recv;
57120 => recv.port;
recv.listen();

recv.event( "/mode, i" ) @=> OscEvent oemode;
recv.event( "/params, f f f f f f f f f f f f f f f f" ) @=> OscEvent oeson;

int mode;
float params[16];



fun void oesonListener() {
    while ( true ) {
        oeson => now;
        while ( oeson.nextMsg() != 0 ) { 
            oeson.getFloat() => params[0];
            oeson.getFloat() => params[1];
            oeson.getFloat() => params[2];
            oeson.getFloat() => params[3];
            oeson.getFloat() => params[4];
            oeson.getFloat() => params[5];
            oeson.getFloat() => params[6];
            oeson.getFloat() => params[7];
            oeson.getFloat() => params[8];
            oeson.getFloat() => params[9];
            oeson.getFloat() => params[10];
            oeson.getFloat() => params[11];
            oeson.getFloat() => params[12];
            oeson.getFloat() => params[13];
            oeson.getFloat() => params[14];
            oeson.getFloat() => params[15];
            
        }
        
        /*
        <<< "params : " + params[0] + " " + params[1] + " " + params[2] + " " +
             params[3] + " " + params[4] + " " + params[5] + " " +
             params[6] + " " + params[7] + " " + params[8] + " " +
             params[9] + " " + params[10] + " " + params[11] + " " +
             params[12] + " " + params[13] + " " + params[14] + " " +
             params[15]>>>;
        */
        
        if (mode == 0) spork ~ mode0(params);
        if (mode == 1) spork ~ mode1(params);
        if (mode == 2) spork ~ mode2(params);
        if (mode == 3) spork ~ mode3(params);
        if (mode == 4) spork ~ mode4(params);
        if (mode == 5) spork ~ mode5(params);
        if (mode == 6) spork ~ mode6(params);
        if (mode == 7) spork ~ mode7(params);
        if (mode == 8) spork ~ mode8(params);
        if (mode == 9) spork ~ mode9(params);
    }
}


fun void oemodeListener() {
    while ( true ) { 
        oemode => now;                     
        while ( oemode.nextMsg() != 0 ) {
            oemode.getInt() => mode;
            <<<"mode  : " + mode>>>;
        }
    }
}

spork ~ oemodeListener();
spork ~ oesonListener();

while (true) {
  50::ms => now;
}

/* ********************************************* */


fun void mode0(float params[]) {

    Step s => dac;
    0.5 => s.gain;
    float t; // time increment
    float v;
    0 => float x;
    0 => float y;
    params[0] => float vite;
    (params[8] * 100000) $ int => int max;
    0 => int step;

    while (step < max) {
        step ++;
        Math.sin(params[4] * 0.8 * pi * t) => y;
        params[1] * 1.2 * Math.sin((params[2] * 0.8 * pi * t) + pi / (params[3] + 0.1) * 2) => x;
        Math.sin(pi * x * params[5] * 2) * Math.sin(pi * y * params[6] * 1.2) => v;
        v => s.next;
        params[7] +=> vite;
        vite / 500000 +=> t;
        1::samp => now;
    }
    <<< "end" >>>;
}


fun void mode1(float params[]) {
    <<< params[0] + " " + params[1] + " " + params[2] + " " +
        params[3] + " " + params[4] + " " + params[5] + " " +
        params[6] + " " + params[7] + " " + params[8] + " " +
        params[9] + " " + params[10] + " " + params[11] + " " +
        params[12] + " " + params[13] + " " + params[14] + " " +
        params[15]>>>;
    <<< "" >>>;      
}



fun void mode2(float params[]) {

}

fun void mode3(float params[]) {

}

fun void mode4(float params[]) {

}

fun void mode5(float params[]) {

}

fun void mode6(float params[]) {

}

fun void mode7(float params[]) {

}

fun void mode8(float params[]) {

}

fun void mode9(float params[]) {

}