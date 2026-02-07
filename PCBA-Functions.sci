disp("PCBA Functions");
disp("Created by Shawn Wolf");
disp("Copyright: Creative Commons Zero");
disp("Need assistance? Try ''HelpMe()''!");

////////////
//Generic//
//////////
function HelpMe()
    disp("Enter One of the following:");
    mprintf("\tAllHelp()\n")
    mprintf("\tInductanceHelp()\n")
    mprintf("\tResistanceHelp()\n")
    mprintf("\tCapacitanceHelp()\n")
    mprintf("\tReactanceHelp()\n")
    mprintf("\tImpedanceHelp()\n")
    mprintf("\tConvertHelp()\n")
endfunction

function AllHelp()
    mprintf("\nResistance Help:\n")
    ResistanceHelp()
    mprintf("\nInductance Help:\n")
    InductanceHelp()
    mprintf("\nCapacitance Help:\n")
    CapacitanceHelp()
    mprintf("\nReactance Help:\n")
    ReactanceHelp()
    mprintf("\nImpedance Help:\n")
    mprintf("\nImpedance Help:\n")
    ImpedanceHelp()
    mprintf("\nConversion Help:\n")
    ConvertHelp()
    mprintf("\n")
endfunction

function ResistanceHelp()
    mprintf("Calculate Series Resistance: rSer(Resistance, Resistance)\n")
    mprintf("Calculate Parallel Resistance: rPar(Resistance, Resistance)\n")
endfunction

function InductanceHelp()
    mprintf("Calculate Series Inductance: lSer(Inductance, Inductance)\n")
    mprintf("Calculate Parallel Inductance: lPar(Inductance, Inductance)\n")
endfunction

function CapacitanceHelp()
    mprintf("Calculate Series Capacitance: cSer(Capacitance, Capacitance)\n")
    mprintf("Calculate Parallel Capacitance: cPar(Capacitance, Capacitance)\n")
endfunction

function ReactanceHelp()
    mprintf("Calculate Inductive Reactance: lReact(Inductance, Frequency)\n")
    mprintf("Calculate Capacitive Reactance: cReact(Capacitance, Frequency)\n")
    mprintf("Calculate Total Reactance: tReact(Inductive Reactance, Capacitive Reactance)\n")
endfunction

function ImpedanceHelp()
    mprintf("Calculate Rectangular Form: zRect(Resistance, Reactance)\n")
    mprintf("Calculate Polar Form: zPolar(Resistance, Reactance)\n")
endfunction

function ConvertHelp()
    mprintf("Convert to Tera: teraConv(Unit)\n")
    mprintf("Convert to Giga: gigaConv(Unit)\n")
    mprintf("Convert to Mega: megaConv(Unit)\n")
    mprintf("Convert to Kilo: kiloConv(Unit)\n")
    mprintf("Convert to Milli: milliConv(Unit)\n")
    mprintf("Convert to Micro: microConv(Unit)\n")
    mprintf("Convert to Nano: nanoConv(Unit)\n")
    mprintf("Convert to Pico: picoConv(Unit)\n")
endfunction

///////////////
//Resistance//
/////////////

function x = rSer(a, b)
    x = a + b;
    mprintf("Series Resistance:\n %.3f Ω\n", x)
endfunction

function x = rPar(a, b)
    x = (1/a + 1/b)^-1;
    mprintf("Parallel Resistance:\n %.3f Ω\n", x)
endfunction

///////////////
//Inductance//
/////////////

function x = lSer(a, b)
    x = a + b;
    mprintf("Series Inductance: \n")
    dispInd(x)
endfunction

function x = lPar(a, b)
    x = (1/a + 1/b)^-1;
    mprintf("Parallel Inductance: \n")
    dispInd(x)
endfunction

function x = dispInd(a)
    if a >= 1 then
        mprintf("%.3f H\n", a)
    elseif a >= 1e-3 then
        mprintf("%.3f mH\n", a*1e3)
    elseif a >= 1e-6 then
        mprintf("%.3f µH\n", a*1e6)
    else
        mprintf("%.3f nH\n", a*1e9)
    end
endfunction

////////////////
//Capacitance//
//////////////

function x = cSer(a, b)
    x = (1/a + 1/b)^-1;
    mprintf("Total Series Capacitance: \n")
    dispCap(x)
endfunction

function x = cPar(a, b)
    x = a + b;
    mprintf("Total Parallel Capacitance: \n")
    dispCap(x)
endfunction

function x = dispCap(a)
    if a >= 1e-3 then
        mprintf("%.3f mF\n", a*1e3)
    elseif a >= 1e-6 then
        mprintf("%.3f µF\n", a*1e6)
    elseif a >= 1e-9 then
        mprintf("%.3f nF\n", a*1e9)
    else
        mprintf("%.3f pF\n", a*1e12)
    end
endfunction

//////////////
//Reactance//
////////////

function x = lReact(a, b)
    x = 2 * %pi * b * a;
    mprintf("Inductive Reactance:\n %.3f Ω\n", x)
endfunction

function x = cReact(a, b)
    x = 1 / (2 * %pi * b * a);
    mprintf("Capacitive Reactance:\n %.3f Ω\n", x)
endfunction

function x = tReact(a, b)
    x = a - b;
    mprintf("Total Reactance:\n %.3f Ω\n", x)
endfunction

//////////////
//Impedance//
////////////

function x = zRect(a, b)
    x = a + b*%i;
    mprintf("Rectangular form: %.3f + %.3fi Ω\n", real(x), imag(x))
endfunction

function zPolar(a, b)
    x = sqrt(a^2 + b^2);
    theta = atan(b / a) * 180 / %pi;
    mprintf("Polar form: %.3f ∠ %.3f° Ω\n", x, theta)
endfunction

////////////////
//Conversions//
//////////////
function x = teraConv(a)
    x = a * 1e-12;
    mprintf("%.3fT\n", x)
endfunction

function x = gigaConv(a)
    x = a * 1e-9;
    mprintf("%.3fG\n", x)
endfunction

function x = megaConv(a)
    x = a * 1e-6;
    mprintf("%.3fM\n", x)
endfunction

function x = kiloConv(a)
    x = a * 1e-3;
    mprintf("%.3fk\n", x)
endfunction

function x = milliConv(a)
    x = a * 1e3;
    mprintf("%.3fm\n", x)
endfunction

function x = microConv(a)
    x = a * 1e6;
    mprintf("%.3fμ\n", x)
endfunction

function x = nanoConv(a)
    x = a * 1e9;
    mprintf("%.3fn\n", x)
endfunction

function x = picoConv(a)
    x = a * 1e12;
    mprintf("%.3fp\n", x)
endfunction