#!/bin/bash

iverilog -o regFile_tb.vvp regFile_tb.v
vvp regFile_tb.vvp
