"use strict";
var __importDefault = (this && this.__importDefault) || function (mod) {
    return (mod && mod.__esModule) ? mod : { "default": mod };
};
Object.defineProperty(exports, "__esModule", { value: true });
const express_1 = __importDefault(require("express"));
const routes_js_1 = __importDefault(require("./routes.js"));
const fs_js_1 = __importDefault(require("./fs.js"));
const app = (0, express_1.default)();
const port = 3001;
app.use("/api", routes_js_1.default);
app.use("/fs", fs_js_1.default);
app.get("/", (req, res) => {
    res.send("Hello World!");
});
app.listen(port, () => {
    console.log(`
  🚀 Server ready at: http://localhost:3001
`);
});
exports.default = app;
