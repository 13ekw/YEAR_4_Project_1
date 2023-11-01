import numpy as np
import pytest
from LebwohlLasher import *

@pytest.mark.parametrize("nmax", [1, 5, 10, 25, 100])  # Test with different nmax values
def test_initdat(nmax):
    
    arr = initdat(nmax)

    # Check if the output is a NumPy array
    assert isinstance(arr, np.ndarray)
    # Check that the dimensions of the array equal nmax
    assert arr.shape == (nmax, nmax)
    # Check if all elements of array are between 0 and 2π
    assert np.all(0 <= arr) and np.all(arr <= 2 * np.pi)


def test_one_energy():
    # initialise arbitary size lattice and random single cell
    nmax = 25
    np.random.seed(42)
    arr = np.random.random_sample((nmax, nmax))*2.0*np.pi
    ix, iy = 1, 1
    
    # check output against true value
    en = one_energy(arr, ix, iy, nmax)
    assert en == -0.5281352876995391

def test_all_energy():
    # initialise arbitary size lattice
    nmax = 25
    np.random.seed(42)
    arr = np.random.random_sample((nmax, nmax))*2.0*np.pi
    
    # check output against true value
    enall = all_energy(arr, nmax)
    assert enall == -683.6831640661935

def test_get_order():
    # initialise arbitary size lattice
    nmax = 25
    np.random.seed(42)
    arr = np.random.random_sample((nmax, nmax))*2.0*np.pi

    # check output against true value
    order = get_order(arr, nmax)
    assert order == 0.2815966805248449

def test_MC_step():
    # initialise arbitary size lattice and arbitrary reduced temp
    nmax = 25
    np.random.seed(42)
    arr = np.random.random_sample((nmax, nmax))*2.0*np.pi
    Ts = 0.5

    # testing function output against calculated true value
    MC = MC_step(arr, Ts, nmax)
    assert MC >= 0 and MC <= 1
