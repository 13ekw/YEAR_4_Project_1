from distutils.core import setup
from Cython.Build import cythonize
import numpy

setup(name="LebwohlLasher_cython_parallel", 
    ext_modules=cythonize("LebwohlLasher_cython_parallel.pyx"),
    include_dirs=[numpy.get_include()])
