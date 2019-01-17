function [SheltCond] = sheltercond(SID,CID)
%% Returns the appropriate shelter condition given the shelter ID and condition ID.
import GetGoogleSpreadsheet.*

shelteryn = GetGoogleSpreadsheet('1_AFQ6RvZZfO2eH_wLDaiZZIDmSDtvosY3lAezlWCkTc')
shelteryn(1,:) = []

A = shelteryn(:,1);
i = 2;
shelternames = {};

while i < size(A,1) + 1
    shelternames(i-1) = shelteryn(i,1) 
    i = i + 1
end

k = 2;

while k < size(A,1) + 1
   data{k-1,1} = cell(shelteryn(k,[2:19]));
   
   k = k + 1;
end   

SheltCond = data{SID}{CID}