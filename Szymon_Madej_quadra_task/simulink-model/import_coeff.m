%------------------------------------------------------------------------
%  FILENAME:  import_coeff.m
%  DESIGNER:  Szymon Madej
%  PROJECT:   Quadratic Approximation Unit
%  DATE:      2025-03-22
%  PURPOSE:   Fuction for importing coefficient from file.
%------------------------------------------------------------------------
function out_dbl = import_coeff(filename,formatSpec, startRow, endRow)
  fileID = fopen(filename,'r');
  out_dbl = textscan(fileID, formatSpec, endRow-startRow+1, 'Delimiter', '', 'WhiteSpace', '', 'TextType', 'string', 'HeaderLines', startRow-1, 'ReturnOnError', false, 'EndOfLine', '\r\n');
  out_dbl = out_dbl{:,1};
  fclose(fileID);
end

