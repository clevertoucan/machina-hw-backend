import express from "express";
import dbRouter from "./routes.js";
import fsRouter from "./fs.js";
import cors from "cors";
const app = express();
const port = 3001;

app.use(
  cors({
    origin: true,
    methods: "GET,PATCH,POST,DELETE,OPTIONS",
    preflightContinue: true,
  })
);

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
