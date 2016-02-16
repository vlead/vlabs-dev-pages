var url = window.location.toString();

function breadCrumbs(url){
  var ls = url.split("//")[1].split("/");
  ls[0] = "Home";
  var result = "<ul class='breadcrumb'>";
  ls.forEach(function(i){
    if(i == "Home"){
      result = result.concat("<li><a href='/'>"+ i +"</a></li>"); 
    }else if(i.indexOf(".html") > -1){
      result = result.concat("<li class='active'>"+ capitalize(i.split(".")[0].replace(new RegExp("-",'g')," ")) +"</li>");
    }else{
      result = result.concat("<li>"+ capitalize(i.replace(new RegExp("-",'g')," ")) +"</li>");
    }
  });
  result = result + "</ul>";
  return result;
}

function capitalize(s){
  var ls = s.split(" ");
  ls = ls.map(function(i){
    return i[0].toUpperCase().concat(i.slice(1));
  });
  return ls.join(" ");
}

$('#content').prepend(breadCrumbs(url));
