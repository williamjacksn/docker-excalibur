# Excalibur

This is a Docker image for [Excalibur][a], a web interface to extract tabular data from PDFs. 

To use this image:

1.  `docker container run -v ~/excalibur-data:/excalibur williamjackson/excalibur initdb`
2.  Edit `~/excalibur-data/excalibur.cfg` and set `web_server_host = 0.0.0.0`.
3.  `docker container run -v ~/excalibur-data:/excalibur -p 5000:5000 williamjackson/excalibur` 
4.  Open http://localhost:5000 in a browser.

[a]: https://github.com/camelot-dev/excalibur
