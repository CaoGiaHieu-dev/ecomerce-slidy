String titleLength(String title,int length)
{
  if(title.length > length)
  {
    title = title.substring(0,length);
    title = "$title...";
    return title;
  }
  else
  {
    return title;
  }
}