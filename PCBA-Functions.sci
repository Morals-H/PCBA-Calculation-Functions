disp("PCBA Functions");
disp("Created by Shawn Wolf");
disp("Copyright: Creative Commons Zero");
disp("Need assistance? Try ''HelpMe()''!");



//////////
//Debug//
////////



function ArrayTest(Array)
    for i = 1:length(Array)
        if length(Array) > 1 then
            disp("Array");
        else
            disp("Integer / Scalar");
        end
    end
endfunction



////////////
//Generic//
//////////



function HelpMe()
    disp("Enter One of the following:");
    mprintf("\tAllHelp()\n");
    mprintf("\tInductanceHelp()\n");
    mprintf("\tResistanceHelp()\n");
    mprintf("\tCapacitanceHelp()\n");
    mprintf("\tReactanceHelp()\n");
    mprintf("\tImpedanceHelp()\n");
    mprintf("\tConvertHelp()\n");
endfunction

function AllHelp()
    mprintf("\nResistance Help:\n");
    ResistanceHelp();
    mprintf("\nInductance Help:\n");
    InductanceHelp();
    mprintf("\nCapacitance Help:\n");
    CapacitanceHelp();
    mprintf("\nReactance Help:\n");
    ReactanceHelp();
    mprintf("\nImpedance Help:\n");
    ImpedanceHelp();
    mprintf("\nConversion Help:\n");
    ConvertHelp();
    mprintf("\n");
endfunction

function ResistanceHelp()
    mprintf("Calculate Series Resistance: rSer([Resistance Array])\n");
    mprintf("Calculate Parallel Resistance: rPar([Resistance Array])\n");
endfunction

function InductanceHelp()
    mprintf("Calculate Series Inductance: lSer([Inductance Array])\n");
    mprintf("Calculate Parallel Inductance: lPar([Inductance Array])\n");
endfunction

function CapacitanceHelp()
    mprintf("Calculate Series Capacitance: cSer([Capacitance Array])\n");
    mprintf("Calculate Parallel Capacitance: cPar([Capacitance Array])\n");
endfunction

function ReactanceHelp()
    mprintf("Calculate Inductive Reactance: lReact(Inductance, Frequency)\n");
    mprintf("Calculate Capacitive Reactance: cReact(Capacitance, Frequency)\n");
    mprintf("Calculate Total Reactance: tReact(Inductive Reactance, Capacitive Reactance)\n");
endfunction

function ImpedanceHelp()
    mprintf("Calculate Rectangular Form: zRect(Resistance, Reactance)\n");
    mprintf("Calculate Polar Form: zPolar(Resistance, Reactance)\n");
endfunction

function ConvertHelp()
    mprintf("Convert to Tera: teraConv(Unit)\n");
    mprintf("Convert to Giga: gigaConv(Unit)\n");
    mprintf("Convert to Mega: megaConv(Unit)\n");
    mprintf("Convert to Kilo: kiloConv(Unit)\n");
    mprintf("Convert to Milli: milliConv(Unit)\n");
    mprintf("Convert to Micro: microConv(Unit)\n");
    mprintf("Convert to Nano: nanoConv(Unit)\n");
    mprintf("Convert to Pico: picoConv(Unit)\n");
endfunction



///////////////
//Resistance//
/////////////



//Series Resistance

function x = rSer(Array)
    s = 0
    for i = 1:length(Array)
        s = s + Array(i)
        mprintf("Add: %g Ω\n", evstr(Array(i)));
    end

    x = s
    mprintf("Resistance: %g Ω\n", evstr(x));
endfunction



//Parallel Resistance

function x = rPar(Array)
    s = 0
    for i = 1:length(Array)
        t = (1 / Array(i))
        s = s + t;
        mprintf("Add: %g Ω\n", evstr(t));
    end

    x = s^-1;
    mprintf("Calculate: %g ^-1\n", evstr(s));
    mprintf("Resistance: %g Ω\n", evstr(x));
endfunction



///////////////
//Inductance//
/////////////



//Series Inductance

function x = lSer(Array)
    s = 0
    for i = 1:length(Array)
        s = s + Array(i)
        mprintf("Add: %g H\n", evstr(Array(i)));
    end
    
    x = s
    dispInd(x)
    mprintf("Inductance: %g H\n", evstr(x));
endfunction



//Parallel Inductance

function x = lPar(Array)
    s = 0
    for i = 1:length(Array)
        t = (1 / Array(i))
        s = s +  t;
        mprintf("Add: %g H\n", evstr(t));
    end

    x = s^-1;
    mprintf("Calculate: %g ^-1\n", evstr(s));
    dispInd(x)
    mprintf("Inductance: %g H\n", evstr(x));
endfunction



//Readable Inductance

function x = dispInd(a)
    if a >= 1 then
        mprintf("Readable: %g H\n", evstr(a));
    elseif a >= 1e-3 then
        mprintf("Readable: %g mH\n", evstr(a*1e3));
    elseif a >= 1e-6 then
        mprintf("Readable: %g µH\n", evstr(a*1e6));
    else
        mprintf("Readable: %g nH\n", evstr(a*1e9));
    end
endfunction



////////////////
//Capacitance//
//////////////



//Series Capacitance

function x = cSer(Array)
    s = 0
    for i = 1:length(Array)
        t = (1 / Array(i))
        s = s +  t;
        mprintf("Add: %g F\n", evstr(t));
    end

    x = s^-1;
    mprintf("Calculate: %g ^-1\n", evstr(s));
    dispCap(x)
    mprintf("Capacitance: %g F\n", evstr(x));
endfunction



//Parallel Capacitance

function x = cPar(Array)
    s = 0
    for i = 1:length(Array)
        s = s + Array(i)
        mprintf("Add: %g F\n", evstr(Array(i)));
    end
    
    x = s
    dispCap(x)
    mprintf("Capacitance: %g F\n", evstr(x));
endfunction



//Readable Capacitance

function x = dispCap(a)
    if a >= 1e-3 then
        mprintf("Readable: %g mF\n", evstr(a*1e3));
    elseif a >= 1e-6 then
        mprintf("Readable: %g µF\n", evstr(a*1e6));
    elseif a >= 1e-9 then
        mprintf("Readable: %g nF\n", evstr(a*1e9));
    else
        mprintf("Readable: %g pF\n", evstr(a*1e12));
    end
endfunction



//////////////
//Reactance//
////////////


//Inductive Reactance

function x = lReact(a, b)
    x = 2 * %pi * b * a
    mprintf("Inductive Reactance: %g Ω\n", evstr(x));
endfunction



//Capacitive Reactance

function x = cReact(a, b)
    x = 1 / (2 * %pi * b * a);
    mprintf("Capacitive Reactance: %g Ω\n", evstr(x));
endfunction


//Total Reactance

function x = tReact(a, b)
    x = a - b;
    mprintf("Total Reactance: %g Ω\n", evstr(x));
endfunction



//////////////
//Impedance//
////////////


//Impedance rectangular form

function x = zRect(a, b)
    x = a + b*%i;
    mprintf("Rectangular form: %g + %gi Ω\n", evstr(real(x)), evstr(imag(x)));
endfunction



//Impedance polar form

function zPolar(a, b)
    x = sqrt(a^2 + b^2);
    theta = atan(b / a) * 180 / %pi;
    mprintf("Polar form: %g ∠ %g° Ω\n", evstr(x), evstr(theta));
endfunction



////////////////
//Conversions//
//////////////



function x = teraConv(a)
    x = a * 1e-12;
    mprintf("%g T\n", evstr(x));
endfunction

function x = gigaConv(a)
    x = a * 1e-9;
    mprintf("%g G\n", evstr(x));
endfunction

function x = megaConv(a)
    x = a * 1e-6;
    mprintf("%g M\n", evstr(x));
endfunction

function x = kiloConv(a)
    x = a * 1e-3;
    mprintf("%g k\n", evstr(x));
endfunction

function x = milliConv(a)
    x = a * 1e3;
    mprintf("%g m\n", evstr(x));
endfunction

function x = microConv(a)
    x = a * 1e6;
    mprintf("%g μ\n", evstr(x));
endfunction

function x = nanoConv(a)
    x = a * 1e9;
    mprintf("%g n\n", evstr(x));
endfunction

function x = picoConv(a)
    x = a * 1e12;
    mprintf("%g p\n", evstr(x));
endfunction
