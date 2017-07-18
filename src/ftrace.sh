#!/bin/bash

debugfs=`sed -ne 's/^debugfs \(.*\) debugfs.*/\1/p' /proc/mounts`
echo nop > $debugfs/tracing/current_tracer
echo 0 > $debugfs/tracing/tracing_on
echo $$ > $debugfs/tracing/set_ftrace_pid
echo function > $debugfs/tracing/current_tracer
echo 1 > $debugfs/tracing/tracing_on
exec "$@"
