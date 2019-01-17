function result = GetGoogleSpreadsheet(DOCID)
%% Download a google spreadsheet as csv and import into a Matlab cell array.
%% IMPORTANT: The spreadsheet must be shared with the "anyone with the link" option

loginURL = 'https://www.google.com'; 
csvURL = ['https://docs.google.com/spreadsheet/ccc?key=' DOCID '&output=csv&pref=2'];

%% Collection of cookies from google.com
cookieManager = java.net.CookieManager([], java.net.CookiePolicy.ACCEPT_ALL);
java.net.CookieHandler.setDefault(cookieManager);
handler = sun.net.www.protocol.https.Handler;
connection = java.net.URL([],loginURL,handler).openConnection();
connection.getInputStream();

%% Accesses spreadsheet via export url. Downloads the CSV
connection2 = java.net.URL([],csvURL,handler).openConnection();
result = connection2.getInputStream();
result = char(readstream(result));

%% Converts CSV to cell array
result = parseCsv(result);

end

function data = parseCsv(data)
%% Splits data > individual lines
data = textscan(data,'%s','whitespace','\n');
data = data{1};
for ii=1:length(data)
   %% Each line, splits string into comma-delimited units
   %% %q format deals with quoting convention
   tmp = textscan(data{ii},'%q','delimiter',',');
   data(ii,1:length(tmp{1})) = tmp{1};
end

end

function out = readstream(inStream)
%% READSTREAM: Reads all bytes from string to uint8
% From http://stackoverflow.com/a/1323535

import com.mathworks.mlwidgets.io.InterruptibleStreamCopier;
byteStream = java.io.ByteArrayOutputStream();
isc = InterruptibleStreamCopier.getInterruptibleStreamCopier();
isc.copyStream(inStream, byteStream);
inStream.close();
byteStream.close();
out = typecast(byteStream.toByteArray', 'uint8'); 

end

