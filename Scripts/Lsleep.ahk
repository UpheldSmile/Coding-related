global Frequency
SetBatchLines, -1
Process, Priority,, A
DllCall("QueryPerformanceFrequency", "Int64*", Frequency)   

lSleep(s_time, ByRef start = "") {
    Critical
    DllCall("QueryPerformanceCounter", "Int64*", CounterBefore)
    if (start != "")
        CounterBefore := start
    Frequency ? Frequency : DllCall("QueryPerformanceFrequency", "Int64*", Frequency)
    if (s_time > 25) {
        DllCall("QueryPerformanceCounter", "Int64*", CounterAfter)
        Critical Off
        Sleep % s_time - (1000 * (CounterAfter - CounterBefore) / Frequency) - 25
    }
    Critical
    End := (CounterBefore + ( Frequency * (s_time/1000))) - 1
    loop
    {
        DllCall("QueryPerformanceCounter", "Int64*", CounterAfter)
    }
    until (End <= CounterAfter)
    Critical Off
    ;return Round(((1000 * (CounterAfter - CounterBefore) / Frequency) - s_time), 4)
    ;will return the offset from the input time, usually in the ten-thousandths of a millisecond
    ;the return calculation will make the sleep take about 0.01 ms longer
    ;there is also an unavoidable ~.002 delay between lines executed by ahk
}

MeasureTime(ByRef begin, ByRef end) {
    Frequency ? Frequency : DllCall("QueryPerformanceFrequency", "Int64*", Frequency)
    return Round(( 1000 * (end - begin) / Frequency), 3)
}
