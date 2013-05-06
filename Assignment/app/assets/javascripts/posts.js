/* This function is to check whether the words of comment text area
is 0. If the words number is 0, the function will return 0 so that
the content in form cannot be submitted */

function Check_Comment() 
{
  var Comment_Field = document.getElementById("Comment_Field");
  var Comment_Length = Comment_Field.value.length;
  if(Comment_Length == 0)
  {
  	alert("Comments cannot be empty");
  	return false;
  }
  else
  {
  	return true;
  }
}