const { onRequest } = require("firebase-functions/v2/https");
const logger = require("firebase-functions/logger");
const mockoon = require("@mockoon/serverless");

const mockEnv = require("./qris.json");

const app = new mockoon.MockoonServerless(mockEnv);

exports.mock = onRequest(app.firebaseApp());

exports.helloWorld = onRequest((request, response) => {
  logger.info("Hello logs!", { structuredData: true });
  response.send("Hello from Firebase!");
});
