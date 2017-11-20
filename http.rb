HTTP 11/17/17

Hypertext - takes you to some additional media (link)

Transfer - sending this hpyertext from one location to another (client > server, then back)

Protocol - based on agreed upon set of rules of how communication takes place

- HTTP Request
Ex: we are connected to a server of a site and you want to request all cats on this site. Because u are requesting, it's a GET request
- 1st part of HTTP Request: HTTP Method
Ex. GET
- 2nd part of this request is: Path
ex: /cats
- last part is the version used to communicate
ex: HTTP/1.1
- Headers:
- Host: mycoolsite.com (site I intended to go to)
- Accept language.en (i want english)

- HTTP Response
- HTTP/1.1 
- status code gives info on how successful this request was: 200 OK
- Headers:
    - content length: 32
    - content-type text/html

    <html>
    </html>