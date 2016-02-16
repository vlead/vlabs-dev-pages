var url = window.location.toString();

function breadCrumbs(url){
  var ls = url.split("//")[1].split("/");
  ls[0] = "Home";
  var result = "<ul class='breadcrumb'>";
  ls.forEach(function(i){
    if(i == "Home"){
      result = result.concat("<li><a href='/'>"+ i +"</a></li>"); 
    }else if(i.indexOf(".html") > -1){
      result = result.concat("<li class='active'>"+ i.split(".")[0].replace("-"," ") +"</li>");
    }else{
      result = result.concat("<li>"+ i.replace("-"," ") +"</li>");
    }
  });
  result = result + "</ul>";
  return result;
}

$('#content').prepend(breadCrumbs(url));
