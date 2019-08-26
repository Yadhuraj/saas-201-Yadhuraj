// This is a closure function https://medium.com/javascript-scene/master-the-javascript-interview-what-is-a-closure-b2f0d2152b36
(function() {
	var sname = document.getElementById("name");
    var phno = document.getElementById("phno");
    var email = document.getElementById("email");
    var dept1 = document.getElementById("dept1");
    var dept2 = document.getElementById("dept2");
    var submit = document.getElementById("butn");
    var em = /^([A-Za-z0-9\.])+\@college+\.edu$/;

  var initialize = function() {
    /*
      1. Add all your event bindings here. Please avoid binding events inline and add your event listeners here.

      onSubmit callback
      disableDuplicateSecondaryDepartment callback,...
    */
    
    dept1.addEventListener("change", disableDuplicateSecondaryDepartment);
    submit.addEventListener("click",onSubmit);
  };

  var disableDuplicateSecondaryDepartment = function(event) {
    // 2. in department2, Should disable the option selected in department1

    let n=0;

  for(var i=0;i<=3;i++){
  	if(dept1.value===dept1.options[i].value)
			{n=i;}
	}

		if (n==0)
			{
				dept2.options[0].disabled = true;
				dept2.options[1].disabled = false;
				dept2.options[2].disabled = false;
				dept2.options[3].disabled = false;
			}
		else
			if(n==1)
			{
				dept2.options[1].disabled = true;
				dept2.options[0].disabled = false;
				dept2.options[2].disabled = false;
				dept2.options[3].disabled = false;
			}
			else
				if(n==2)
			{
				dept2.options[2].disabled = true;
				dept2.options[1].disabled = false;
				dept2.options[0].disabled = false;
				dept2.options[3].disabled = false;
			}
			else
				if(n==3)
			{dept2.options[3].disabled = true;
			dept2.options[1].disabled = false;
				dept2.options[2].disabled = false;
				dept2.options[0].disabled = false;}
}
  

	


  var constructData = function() {
    var data = { "name": sname.value,
    			 "phno": phno.value,
    			 "emailaddress": email.value,
    			 "department1": dept1.value, 
    			 "department2": dept2.value};

    // 3. Construct data from the form here. Please ensure that the keys are the names of input elements
  
    return data;
  }

  var validateResults = function(data) {
  	var format = /[ !#$%^&*()_+\-=\[\]{};':"\\|,<>\/?]/;
    var isValid = true; 
    // console.log(data);
 	var x= data["name"].length;
 	// if(x>5)
 	// {isvalid = false;
 	// 	console.log("name error");}

 	if(data["name"].length>100){
 		isValid=false;
 		console.log("name error");
 	}

 	if(data["phno"].length>10){
 		isValid=false;
 		console.log("phno error");
 	}
 		
 	if(dept1.value==dept2.value)
 		{isValid=false;
 			console.log("dept error");}

 	if(!data["emailaddress"].endsWith("@college.edu"))
 	{isValid=false;
 			console.log("email error1");}

 	if(format.test(data["emailaddress"]))
 	{isValid=false;
 			console.log("email error");}

    // 4. Check if the data passes all the validations here

    return isValid;
  };

  var onSubmit = function(event) {
    // 5. Figure out how to avoid the redirection on form submit
event.preventDefault();
    var data = constructData();

    if (validateResults(data)) {
      printResults(data);
    } else {
      var resultsDiv = document.getElementById("results");
      resultsDiv.innerHTML = '';
      resultsDiv.classList.add("hide");
    }
  };

  var printResults = function(data) {
    var constructElement = function([key, value]) {
      return `<p class='result-item'>${key}: ${value}</p>`;
    };

    var resultHtml = (Object.entries(data) || []).reduce(function(innerHtml, keyValuePair) {
      debugger
      return innerHtml + constructElement(keyValuePair);
    }, '');
    var resultsDiv = document.getElementById("results");
    resultsDiv.innerHTML = resultHtml;
    resultsDiv.classList.remove("hide");
  };

  /*
    Initialize the javascript functions only after the html DOM content has loaded.
    This is to ensure that the elements are present in the DOM before binding any event listeners to them.
  */
  document.addEventListener('DOMContentLoaded', initialize);
})();
