function generateUrl(baseUrl, path, parameters) {
    _baseUrl = addSlashIfNeeded(baseUrl);
    _path = addSlashIfNeeded(path);
    _parameters = parameters || {};

    var parameterString = constructParameterString(_parameters);

    if (parameterString == "") {
        return _baseUrl + _path;
    } else {
        return _baseUrl + _path + "?" + parameterString;
    }
}

function addSlashIfNeeded(str) {
    // can't use endsWith... why...?
    return (str.slice(-1) == "/") ? str : str + "/";
}

function constructParameterString(parameters) {
    var paramArray = [];
    for (var key in parameters) {
        paramArray.push(key + "=" + encodeURIComponent(parameters[key]));
    }

    return paramArray.join("&");
}