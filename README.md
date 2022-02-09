# Server API
This a simple API made with Express, Node.js.

## How to set up locally

1. Clone the project.
2. Run 
```sh
$ npm install 
```
3. Run 
```sh
$ npm test
```

# How to interact with APIs Endpoints locally 
### Countries
`http://127.0.0.1:3000/countries`

### Todos
`http://127.0.0.1:3000/todos`

### Names
`http://127.0.0.1:3000/names`

# How run docker image
 1. Run 
```sh
$ docker pull cyrilbaah/api-server:latest
```
 2. Run 
```sh
$ docker run -dp 3000:3000 cyrilbaah/api-server:latest
```