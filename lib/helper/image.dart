//check if image is svg or not
bool checkTypeImageNetworkSvg(String image)
{
  if(image.substring(image.length-3) == "svg")
  {
    return true;
  }
  else
  {
    return false;
  }
}