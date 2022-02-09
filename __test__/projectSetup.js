const request = require("supertest");
const app = require("../app.js");
const expect = require("chai").expect;

describe("Project setup ", () => {
  it("responds with API is Online!", (done) => {
    request(app).get("/").expect("API is Online!", done);
  });
});


