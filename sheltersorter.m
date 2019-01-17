function [SortedTable,ShelterSorted,BedsAvail] = sheltersorter()
    import GetGoogleSpreadsheet.*

    SurveyResult = GetGoogleSpreadsheet('1RBRAmY2yZjaSsc8plyppMdVbGPnWDBTEa267WWr8o3Q')
    SurveyResult(1,:) = []

    ShelterName = SurveyResult(:,2);
    BedsAvail = SurveyResult(:,3);
    BedsAvail = cellfun(@str2num,BedsAvail);
    [BedsAvail,indshelt] = sort(BedsAvail);
    BedsAvail = flip(BedsAvail)
    indshelt = flip(indshelt);
    ShelterSorted = ShelterName(indshelt)
    SortedTable = table(ShelterSorted,BedsAvail)
end