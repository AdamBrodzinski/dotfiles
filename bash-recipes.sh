# add an extra new line for every line of output
foo | sed 'G'

# fix log output that prints \n so that it's a real new line
sed 's/\\n/\n/g'

# add an extra new line for lines that start with 'level'
foo | sed '/level/G'
foo | sed '/^{/G'

# ------- Testing ------

# show stdout logs, ony run failed tests, stop on failed test
pytest -v --lf -x 
