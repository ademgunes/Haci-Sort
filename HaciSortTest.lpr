program HaciSortBenchmark;

{$mode objfpc}{$H+}

uses
  {$IFDEF UNIX}
  cthreads,
  {$ENDIF}
  SysUtils, DateUtils, HaciSortUnit;

const
  ARRAYSIZE = 100000;

var
  testArray, testHaci, testCounting: TIntegerArray;
  i: integer;
  startTime, endTime: TDateTime;
  haciMs, countingMs: int64;
begin
  Randomize;

  SetLength(testArray, ARRAYSIZE);

  // Generate dense realistic dataset (numbers between 1 and 100)
  for i:=0 to ARRAYSIZE-1 do
    testArray[i] := Random(100) + 1;

  Writeln('==================================================');
  Writeln('   HACI SORT vs COUNTING SORT BENCHMARK TOOL      ');
  Writeln('==================================================');
  Writeln('Dataset Size : ', ARRAYSIZE, ' elements');
  Writeln('Data Range   : 1 to 100 (Highly Dense)');
  Writeln('--------------------------------------------------');

  // Clone array for Haci Sort
  SetLength(testHaci, ARRAYSIZE);

  for i:=0 to ARRAYSIZE-1 do testHaci[i] := testArray[i];

  // 1. BENCHMARK HACI SORT
  Writeln('Running Haci Sort...');
  startTime := Now;
  testHaci := HaciSort(testHaci);
  endTime := Now;
  haciMs := MilliSecondsBetween(startTime, endTime);
  Writeln('-> Haci Sort completed in: ', haciMs, ' ms');

  Writeln;

  // Clone array for Counting Sort
  SetLength(testCounting, ARRAYSIZE);

  for i:=0 to ARRAYSIZE-1 do testCounting[i] := testArray[i];

  // 2. BENCHMARK COUNTING SORT
  Writeln('Running Counting Sort...');
  startTime := Now;
  testCounting := CountingSort(testCounting);
  endTime := Now;
  countingMs := MilliSecondsBetween(startTime, endTime);
  Writeln('-> Counting Sort completed in: ', countingMs, ' ms');

  // Verification Check
  Writeln('--------------------------------------------------');
  if (testHaci[0] = testCounting[0]) and (testHaci[ARRAYSIZE-1] = testCounting[ARRAYSIZE-1]) then
    Writeln('Verification: SUCCESS! Both arrays sorted correctly')
  else
    Writeln('Verification: FAILED! Mismatch detected ');

  Writeln('==================================================');
  Writeln('Press ENTER to exit...');
  Readln;
end.
