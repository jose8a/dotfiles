### 1. REMOVE all attributes (except for the HREF) from the anchor tags in bookmarksXXX.html file within VIM:

```
  :XXX,YYYs/ADD.*">/>/
```

### 2. COPY section/range of links from main bookmarksXXX.html file to individual files:

```
  $> sed -n 'XXX,YYYp' bookmarksXXX.html >> newfile.html
```

### 3. Use the [extract-links.sed](file:///Users/jose8a/Desktop/bookmarks/extract-links.sed) script to convert the HTML file (newfile.html) into markdown format so that it contains only section/folder titles and link-urls/link-title pairs.Save the markdown format into newfile.md-type of name.

### 4. Use the [open-mdlinks.sh](file:///Users/jose8a/Desktop/bookmarks/open-mdlinks.sh) script to open all links in the Markdown file in a browser

### 5. Inspect all links open in the browser. Fix/Update in the Markdown file any URLs which are incorrect - if possible.  Delete any links for which an updated URL-path cannot be found.
  * [X] cont-ed-links.md
  * [ ] dev-links.md
  * [ ] gtd-links.md (this entire file needs tons of filtering/deleteing)
  * [ ] jobs-links.md (this entire file needs tons of filtering/deleteing)
  * [ ] web-svcs-links.md (this entire file needs tons of filtering/deleteing)

### 6. Copy Each link-section/folder/tabset to an individual card on the Trello board named ChromeBookmarks
  * [ ] cont-ed-links.md
  * [ ] dev-links.md
  * [ ] gtd-links.md (this entire file needs tons of filtering/deleteing)
  * [ ] jobs-links.md (this entire file needs tons of filtering/deleteing)
  * [ ] web-svcs-links.md (this entire file needs tons of filtering/deleteing)
