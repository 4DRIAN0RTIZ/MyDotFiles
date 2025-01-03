require('websearcher').setup {
  open_cmd = 'wslview',
  search_engine = 'Google',
  use_w3m = false,
  search_engines = {
      GoogleScholar = "https://scholar.google.com/scholar?q=",
      Wikipedia = "https://<lang>.wikipedia.org/w/index.php?search=",
      GitHub = "https://github.com/search?q=",
      MDN = "https://developer.mozilla.org/en-US/search?q=",
      DevDocs = "https://devdocs.io/#q=",
      StackOverflow = "https://stackoverflow.com/search?q=",
      SearchCode = "https://searchcode.com/?q=",
      PhpNet = "https://www.php.net/search.php?show=quickref&pattern=",
   }
}
