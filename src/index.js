import express from "express";
import router from "./routes.js";
const app = express();
const port = 3001;

app.use("/api", router);

app.get("/", (req, res) => {
  res.send("Hello World!");
});

app.listen(port, () => {
  console.log(`
  🚀 Server ready at: http://localhost:3001
`);
});

export default app;
