# Computational Physics Models
This repository contains a few computational physics models using techniques such as numerical integration, ODE solving, and the Monte Carlo method.

# Description of Models

## Hydrogen Atom Radial Wavefunctions
In this notebook, we numerically solve the hydrogen atom radial wavefunction eigenvalue problem arising from applying separation of variables to the Schrodinger equation with a 1/r central potential.  We compare the numerical solutions to the analytical solutions for various values of the principal and angular momentum quantum numbers, and investigate what happens when we slightly vary the quantum numbers from their integer domain.  We then impose a positive nuclear radius by assuming the nucleus is a sphere of uniform charge density.  We compute numerical solutions for this case and compare them to the previous case, again invesitgating the effect of varying the quantum numbers.

## Ephemeris of Earth
In this notebook, we numerically integrate the Earth's orbit around the sun for many years in the future.  We compute orbital periods and investigate how the time of year of the aphelion and perihelion and the orbit's eccentricity change over time.  We then compute and plot the solar energy flux over the entire Earth and the northern hemisphere over the integrated period.  The integration and analysis is then repeated with Jupiter included in the system.

## Argon Diffusion
In this notebook, we employ a Monte Carlo model to simulate the diffusion of an argon atom in argon gas.  We plot the position of the atom over time and compute the kinetic energy distribution of the atom.  To improve computation times, we repeat the simulations using the open-source JIT compiler [Numba](https://numba.pydata.org), which translates a subset of Python and [NumPy](https://numpy.org) code into fast machine code.  This improves computation time roughly 50-fold.

## Planetary Dynamics
Here, we employ a simple MATLAB model to numerically solve the [n-body problem](https://en.wikipedia.org/wiki/N-body_problem) in two and three dimensions.
