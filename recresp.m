function [recresp] = recresp()
    %% This function stores the latest response from the 'Match Me (Responses)' spreadsheets.
    %% Stores the responses into a cell array.
    import GetGoogleSpreadsheet.*

    hiresp = GetGoogleSpreadsheet('1wfeYA3vb2Lx3gI7b-xWP1THXcazCi6CPX9_NoJLa3lo')

    [rcount,ccount] = size(hiresp)

    recresp = hiresp(rcount,2:ccount)