function test(){   
    var doc = new ActiveXObject("Msxml2.DOMDocument.6.0");
    doc.async = false;
    doc.loadXML("<configuration></configuration>");
    if (doc.parseError.errorCode == 0) {
       var configuration = doc.documentElement;
       var appSettings = doc.createElement("appSettings");
       var filePaths = doc.createElement("filePaths");
       var timeouts = doc.createElement("timeouts");
       var credentials = doc.createElement("credentials");
       appSettings.appendChild(filePaths); 
       appSettings.appendChild(timeouts); 
       appSettings.appendChild(credentials); 
       configuration.appendChild(appSettings);
       
       Log.Message(configuration.xml);
       doc.save("myconfig.xml");
    } else {
       Log.Message("You have error " + doc.parseError.reason);
    }    
}

/*

<configuration>
    <Settings>
        <filePaths>
            <filePath name: value: lastSaveTime: lastSavedBy: lastReadTime: lastReadBy: readCount: />
        <filePaths>
        <timeouts>
            <timeout name: value: lastSaveTime: lastSavedBy: lastReadTime: lastReadBy: readCount: />
        </timeouts>
        <credentials>
            <credential name: password:<encrypted> lastSaveTime: lastSavedBy: lastReadTime: lastReadBy: readCount: />
        </credentials>
    </Settings>
    <checksum />
</configuration>

*/