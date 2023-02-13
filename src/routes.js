import { Router } from "express";
import { Prisma, PrismaClient } from "@prisma/client";

const router = Router();
const client = new PrismaClient();

/**
 * Casts any BigInts present in a query result to a regular integer
 * @param {*} jsonData
 * @returns
 */
export function sanitizeBigInts(jsonData) {
  if (typeof jsonData === "object") {
    for (var key in jsonData) {
      if (typeof jsonData[key] === "bigint") {
        jsonData[key] = Number(jsonData[key]);
      } else if (typeof jsonData[key] === "object" && jsonData[key] !== null) {
        jsonData[key] = sanitizeBigInts(jsonData[key]);
      }
    }
  }
  return jsonData;
}

/**
 * GET /api/<modelname>/<id>
 * This is the main single object fetch function that each model uses. Supports an 'include' query parameter
 * that can be used to add relations to the object that comes back
 * @param req Express request
 * @param res Express response
 * @param model The Prisma model that corresponds to the request
 * @returns a single database object
 */
async function getById(req, res, model) {
  let { id } = req.params;
  let { include } = req.query;
  let found;
  if (include) {
    include = JSON.parse(include);
    found = await model.findUnique({ where: { id: Number(id) }, include });
  } else {
    found = await model.findUnique({ where: { id: Number(id) } });
  }
  if (found === null) {
    return res.sendStatus(404);
  }
  res.body = sanitizeBigInts(found);
  return res.json(res.body);
}

/**
 * GET /api/<modelname>
 * This is the main multi-fetch function that each model uses. Supports an 'include' query parameter
 * that can be used to add relations to the objects that come back
 * @param req Express request
 * @param res Express response
 * @param model The Prisma model that corresponds to the request
 * @returns multiple database objects in an array
 */
async function getList(req, res, model) {
  let { include } = req.query;
  let found;
  if (include) {
    include = JSON.parse(include);
    found = await model.findMany({ include });
  } else {
    found = await model.findMany();
  }
  if (found === null) {
    return res.sendStatus(404);
  }
  res.body = sanitizeBigInts(found);
  return res.json(res.body);
}

router.get(
  "/buildfile",
  async (req, res) => await getList(req, res, client.buildFile)
);
router.get(
  "/buildfile/:id",
  async (req, res) => await getById(req, res, client.buildFile)
);

router.get(
  "/cadfile",
  async (req, res) => await getList(req, res, client.cADFile)
);
router.get(
  "/cadfile/:id",
  async (req, res) => await getById(req, res, client.cADFile)
);

router.get(
  "/contract",
  async (req, res) => await getList(req, res, client.contract)
);
router.get(
  "/contract/:id",
  async (req, res) => await getById(req, res, client.contract)
);

router.get(
  "/customer",
  async (req, res) => await getList(req, res, client.customer)
);
router.get(
  "/customer/:id",
  async (req, res) => await getById(req, res, client.customer)
);

router.get(
  "/customerpart",
  async (req, res) => await getList(req, res, client.customerPart)
);
router.get(
  "/customerpart/:id",
  async (req, res) => await getById(req, res, client.customerPart)
);

router.get("/job", async (req, res) => await getList(req, res, client.job));
router.get("/job/:id", async (req, res) => await getById(req, res, client.job));

router.get("/run", async (req, res) => await getList(req, res, client.run));
router.get("/run/:id", async (req, res) => await getById(req, res, client.run));

router.get(
  "/scanmetric",
  async (req, res) => await getList(req, res, client.scanMetric)
);
router.get(
  "/scanmetric/:id",
  async (req, res) => await getById(req, res, client.scanMetric)
);

router.get(
  "/scanraw",
  async (req, res) => await getList(req, res, client.scanRaw)
);
router.get(
  "/scanraw/:id",
  async (req, res) => await getById(req, res, client.scanRaw)
);

router.get(
  "/scanresult",
  async (req, res) => await getList(req, res, client.scanResult)
);
router.get(
  "/scanresult/:id",
  async (req, res) => await getById(req, res, client.scanResult)
);

router.get(
  "/slicefile",
  async (req, res) => await getList(req, res, client.sliceFile)
);
router.get(
  "/slicefile/:id",
  async (req, res) => await getById(req, res, client.sliceFile)
);

export default router;
