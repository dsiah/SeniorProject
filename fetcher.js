let cheerio = require('cheerio')
let request = require("request")

let vid = process.argv[2]
if (vid.length > 0) {
  let url = "https://www.youtube.com/watch?v=" + vid
  request({
      url: url,
      json: true
    }, function (error, response, body) {
      if (!error && response.statusCode === 200) {
        // console.log(body) // Print the json response
        let $ = cheerio.load(body)
        console.log($('#eow-description').text())
      }
  });
}
