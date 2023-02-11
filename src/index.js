import express from "express";
import dbRouter from "./routes.js";
import fsRouter from "./fs.js";
const app = express();
const port = 3001;

app.use("/api", dbRouter);
app.use("/fs", fsRouter);

app.get("/", (req, res) => {
  res.send("Hello World!");
});

app.listen(port, () => {
  console.log(`
  🚀 Server ready at: http://localhost:3001
`);
});

export default app;
