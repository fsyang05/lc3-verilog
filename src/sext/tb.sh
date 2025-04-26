#!/bin/bash

iverilog -o sext_tb.vvp sext_tb.v
vvp sext_tb.vvp
