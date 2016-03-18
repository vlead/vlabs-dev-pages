var url = window.location.toString();

$('.c-dropdown').hover(function(){
  $(this).find('ul.c-dropdown-menu')[0].style.display = 'block';
},function(){
  $(this).find('ul.c-dropdown-menu')[0].style.display = 'none';
});


function breadCrumbs(url){
  var ls = url.split("//")[1].split("/");
  var gitSource = "https://github.com/vlead/vlabs-dev-pages/tree/master/src";
  ls[0] = "Home";
  var result = "<ul class='breadcrumb'>";
  if(ls.length == 2){
    result = result.concat("<li><a href='/'>Home</a></li>");
    result = result.concat("<li class='gitLink'><a href='"+gitSource+"/index.org'>Edit on Github</a></li>")
    return result.concat("</ul>");
  }
  if(ls[ls.length-1] == ""){
    ls = ls.slice(0,ls.length-1);
  }
  ls.forEach(function(i){
    if(i == "Home"){
      result = result.concat("<li><a href='/'>"+ i +"</a></li>");
    }else if(i.indexOf(".html") > -1){
      result = result.concat("<li class='active'>"+ capitalize(i.split(".")[0].replace(new RegExp("-",'g')," ")) +"</li>");
    }else{
      result = result.concat("<li><a href='/"+i+"/'>"+ capitalize(i.replace(new RegExp("-",'g')," ")) +"</a></li>");
    }
  });

  var gitUrl;

  if(url.indexOf(".html") == -1){
    gitUrl =  url.replace("http://".concat(window.location.host),gitSource).concat("index.org")
  }else{
    gitUrl = url.replace("http://".concat(window.location.host),gitSource).replace(".html",".org");
  }
  
  result = result.concat("<li class='gitLink'><a href='"+gitUrl+"'>Edit on Github</a></li>")
  result = result.concat("</ul>");
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


