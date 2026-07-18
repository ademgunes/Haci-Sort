unit HaciSortUnit;

{$mode objfpc}{$H+}

interface

uses
  Classes, SysUtils;

type
  TIntegerArray = array of integer;

function HaciSort(const Arr: TIntegerArray): TIntegerArray;
function CountingSort(const Arr: TIntegerArray): TIntegerArray;

implementation

function HaciSort(const Arr: TIntegerArray): TIntegerArray;
var
  sortedArray: TIntegerArray;
  offsets: array of integer;
  minVal, maxVal, range, i, len, diff: integer;
begin
  SetLength(Result, 0);

  len := Length(Arr);
  if len = 0 then Exit;

  // STEP 1: Find minimum and maximum values
  minVal := Arr[0];
  maxVal := Arr[0];

  for i:=1 to len-1 do
  begin
    if Arr[i] < minVal then minVal := Arr[i];
    if Arr[i] > maxVal then maxVal := Arr[i];
  end;

  // STEP 2: Find offsets from minimum and frequencies map
  range := maxVal-minVal+1;

  SetLength(offsets, range);

  for i:=0 to range-1 do offsets[i] := 0;

  for i:=0 to len-1 do
    inc(offsets[Arr[i] - minVal]);

  // STEP 3: Relocating diffs and offsets
  diff := 0;
  for i:=0 to range-1 do
  begin
    maxVal := offsets[i];
    offsets[i] := diff;
    diff := diff + maxVal;
  end;

  // STEP 4: Drop to 0 (zero)
  SetLength(sortedArray, len);

  for i:=0 to len-1 do
  begin
    diff := Arr[i] - minVal;
    sortedArray[offsets[diff]] := Arr[i];
    inc(offsets[diff]);
  end;

  Result := sortedArray;
end;


// --- Counting Sort (Official Version) ---
function CountingSort(const Arr: TIntegerArray): TIntegerArray;
var
  minVal, maxVal, range, i, j, k, len: integer;
  counts, sortedArray: TIntegerArray;
begin
  SetLength(Result, 0);

  len := Length(Arr);
  if len = 0 then Exit;

  minVal := Arr[0];
  maxVal := Arr[0];

  for i:=1 to len-1 do
  begin
    if Arr[i] < minVal then minVal := Arr[i];
    if Arr[i] > maxVal then maxVal := Arr[i];
  end;

  range := maxVal - minVal + 1;

  SetLength(counts, range);

  for i:=0 to range-1 do counts[i] := 0;

  for i:=0 to len-1 do
    inc(counts[Arr[i] - minVal]);

  SetLength(sortedArray, len);

  k := 0;
  for i:=0 to range-1 do
  begin
    for j:=1 to counts[i] do
    begin
      sortedArray[k] := i + minVal;
      inc(k);
    end;
  end;

  Result := sortedArray;
end;

end.
