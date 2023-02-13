import { Router } from "express";
import fs from "fs";
import path from "path";
import { PrismaClient } from "@prisma/client";
import { sanitizeBigInts } from "./routes.js";

const client = new PrismaClient();
const router = Router();
const baseDir = "./web_hw_files";

/**
 * GET /fs/path/<path_to_file>
 * This route handles all of the file requests - if the path exists, the route will
 * send back the file data if the path leads to a file, or if the path is a directory,
 * it will return an array of filenames contained in the directory
 */
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

/**
 * GET /fs/tree
 * This function converts the structure of a directory into JSON to send
 * to the frontend so that we can build our document tree explorer
 * @param currentDir the current directory
 * @returns a JSON object representing the structure of the input directory
 */
function tree(currentDir) {
  if (fs.existsSync(currentDir)) {
    const fileTree = {};
    const stats = fs.lstatSync(currentDir);
    if (stats.isDirectory()) {
      fs.readdirSync(currentDir).forEach((path) => {
        fileTree[path] = tree(currentDir + "/" + path);
      });
    } else if (stats.isFile()) {
      return null;
    }
    return fileTree;
  }
}

/**
 * GET /fs/list
 * This function fetches all of the files in the database with relations that
 * will be required for filtering.
 * @param req Express request
 * @param res Express response
 */
async function list(req, res) {
  const clients = [
    client.cADFile,
    client.scanMetric,
    client.scanRaw,
    client.scanResult,
    client.sliceFile,
  ];
  const include = {
    Job: { include: { Contract: { include: { Customer: true } } } },
  };

  const files = (
    await Promise.all([
      client.buildFile.findMany({ include: { Runs: true, ...include } }),
      ...clients.map((client) => client.findMany({ include })),
    ])
  ).flat();

  res.json(sanitizeBigInts(files));
}

router.get("/tree", async (req, res) => res.json(tree(baseDir)));
router.get("/list", list);

export default router;
