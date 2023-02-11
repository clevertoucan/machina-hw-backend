import { Router } from "express";
import fs from "fs";
import path from "path";

const router = Router();
const baseDir = "./web_hw_files";

router.get("/path/*", async (req, res) => {
  const filePath = baseDir + req.originalUrl.replace("/fs/path", "");
  console.log(filePath);
  if (fs.existsSync(filePath)) {
    const stats = fs.lstatSync(filePath);
    if (stats.isDirectory()) {
      res.send(fs.readdirSync(filePath));
    } else if (stats.isFile()) {
      res.sendFile(path.resolve(filePath));
    }
  } else {
    res.sendStatus(404);
  }
});

function tree(currentDir) {
  if (fs.existsSync(currentDir)) {
    const stats = fs.lstatSync(currentDir);
    if (stats.isDirectory()) {
      return fs.readdirSync(currentDir).map((path) => {
        return { [path]: tree(currentDir + "/" + path) };
      });
    } else if (stats.isFile()) {
      return {};
    }
  }
}

router.get("/tree", async (req, res) => res.json(tree(baseDir)));

export default router;
