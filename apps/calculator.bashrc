#!/bin/bash

## Calculator

var CALC_PYTHON "$TERMINAL_APPS/.calc.py"

# Run calculator
alias calc="bpython -i $CALC_PYTHON"

# Edit the calculator script
alias calcedit="nvim $CALC_PYTHON"
