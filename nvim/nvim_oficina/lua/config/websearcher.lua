require('websearcher').setup {
  open_cmd = 'wslview',
  search_engine = 'Google',
  use_w3m = false,
  search_engines = {
      GoogleScholar = "https://scholar.google.com/scholar?q=",
      Wikipedia = "https://<lang>.wikipedia.org/w/index.php?search=",
   }
}
