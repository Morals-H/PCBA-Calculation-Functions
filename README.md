# PCBA-Calculation-Functions
KiCAD Companion is a Scilab-based utility for electronics enthusiasts, students, and technicians, designed to simplify circuit analysis and calculations

Features:

    Resistance, Capacitance, and Inductance: compute series/parallel values with tolerance.

    Reactance: calculate inductive, capacitive, and total reactance.

    Impedance: Figure impedance in both polar and rectangular forms.

    Ohm’s Law Calculations: figure voltage, current, and resistance with tolerance.

    Unit Conversions: convert between tera, giga, mega, kilo, milli, micro, nano, and pico units.

    Help Menu: built-in HelpMe() system guides you through all available commands and inputs.

Requirements:
    Scilab

Try me:
    Z = zRect(rSer([10,22,33])+rPar([100,220,330])+lPar([1e-3,2e-3,3e-3])+cPar([cSer([20e-6,40e-6,60e-6]),1e-6,2e-6,3e-6]), tReact(lReact(lSer([1e-3,2e-3,3e-3]),5000), cReact(cSer([1e-6,2e-6,3e-6]),5000))); zPolar(real(Z),imag(Z));