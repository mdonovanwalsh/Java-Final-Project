window.onload = function () {
    // add event handlers for buttons
    document.querySelector("#SearchButton").addEventListener("click", searchForTags);
//    getAllTags();
//    displayAllQuizzes();
//    document.querySelector("#takeQuiz").addEventListener("click", takeQuiz);
//    document.querySelector("table").addEventListener("click", handleRowClick);
};

function getAllTags() {
    let url = "quizapp/tags";
    var xmlhttp = new XMLHttpRequest();
    xmlhttp.onreadystatechange = function () {
        if (xmlhttp.readyState === 4 && xmlhttp.status === 200) {
            var resp = xmlhttp.responseText;
            console.log("-->" + resp);
            if (resp.search("ERROR") >= 0) {
                alert("oh no... see console for error");
                console.log(resp);
            } else {
                buildDropdown(xmlhttp.responseText);
            }
        }
    };
    xmlhttp.open("GET", url, true);
    xmlhttp.send();
}

function buildDropdown(text) {
    var data = JSON.parse(text);
    var theSelect = document.querySelector("#select");
    let html = "";
    for (let i = 0; i < data.length; i++) {
        let tag = data[i];
        html += "<option>" + tag["tagName"] + "</option>";
    }
    theSelect.innerHTML = html;
}

