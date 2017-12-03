#!/usr/bin/env python

from pymodelica import compile_fmu

model_name = 'SimpleTest'
mo_file = 'SimpleTest.mo'

my_fmu = compile_fmu(model_name, mo_file)
