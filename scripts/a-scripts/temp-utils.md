### open (in a browser) a range of links from a Markdown file using the open-mdlinks.sh script
sed -n 'XXX,YYYp' LINKS-FILE > temp-links.md && /path/to/open-mdlinks.sh temp-links.md

### ...
