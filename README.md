# Excalibur

This is a Docker image for [Excalibur][a], a web interface to extract tabular data from PDFs. 

To use this image:

1.  `docker container run -v ~/excalibur-data:/home/python/excalibur -p 8080:8080 ghcr.io/williamjacksn/excalibur`
2.  Open http://localhost:8080 in a browser.

If you want to use a different port:

`docker container run -v ~/excalibur-data:/home/python/excalibur -e PORT=8081 -p 8081:8081 ghcr.io/williamjacksn/excalibur`

[a]: https://github.com/camelot-dev/excalibur
