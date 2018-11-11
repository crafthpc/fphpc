# FPHPC Benchmark Suite

This is a collection of programs containing floating-point arithmetic with the
immediate goal of aiding the development and evaluation of floating-point
precision and correctness analysis tools. The long-term goal is to support and
enable the scaling of such tools to provide insights for high-performance
computing (HPC) applications. This collection aims to address the "middle
ground" between real-valued expressions (such as those contained in the
[FPBench](http://fpbench.org) collection) and full HPC applications.

# Installing

The benchmarks themselves are located in the `bench` folder and they can be
built using the standard `make` command. See the benchmark folders for more info
about each individual benchmark.

Because this suite is intended to provide test cases for precision and
correctness analysis tools, one goal of the suite is to provide correctness
criteria for the benchmarks. For the benchmarks where these routines have been
written, they can be run using the `make test` command.

Some of the benchmarks are not directly hosted in this repository in order to
avoid licensing issues. Those benchmarks are acquired in a reproducible way
(often by downloading or cloning a particular version) as specified by the
provided Makefiles.

Currently, the only targetted and supported platform is x86-64 Linux.

# Contributing

This software effort is still in early stages of development, and as such
contributions and feedback are very welcome! Please use the Issues tab to submit
bug reports or see a list of what still needs to be done.

# License

The code in this repository is distributed under the MIT license.
