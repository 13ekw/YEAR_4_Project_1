import sys
from LebwohlLasher_cython import main

if int(len(sys.argv)) == 4:
    main(int(sys.argv[1]))
else:
    print("Usage: python {} <ITERATIONS>", format(sys.argv[0]))