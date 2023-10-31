import numpy as np
import pytest
from LebwohlLasher import initdat, one_energy

@pytest.mark.parametrize("nmax", [1, 5, 10, 100])  # Test with different nmax values
def initdat(nmax):
    
    arr = initdat(nmax)

    # Check if the output is a NumPy array
    assert isinstance(arr, np.ndarray)
    # Check that the dimensions of the array equal nmax
    assert arr.shape == (nmax, nmax)
    # Check if all elements of array are between 0 and 2π
    assert np.all(0 <= arr) and np.all(arr <= 2 * np.pi)


def test_one_energy(ix, iy, nmax, expected_energy):

def test_all_energy(arr,nmax):

def test_get_order(arr,nmax):

def test_MC_step(arr,Ts,nmax):

