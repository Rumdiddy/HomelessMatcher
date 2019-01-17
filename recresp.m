function [recresp] = recresp()
    %% This function stores the latest response from the 'Match Me (Responses)' spreadsheets.
    %% Stores the responses into a cell array.
    import GetGoogleSpreadsheet.*

    hicresp = GetGoogleSpreadsheet('1wfeYA3vb2Lx3gI7b-xWP1THXcazCi6CPX9_NoJLa3lo')

   [rcount1,ccount1] = size(hicresp)

    recresp = hicresp(rcount1,2:ccount1)