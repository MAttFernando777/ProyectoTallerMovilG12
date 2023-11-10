"use strict";
var __importDefault = (this && this.__importDefault) || function (mod) {
    return (mod && mod.__esModule) ? mod : { "default": mod };
};
Object.defineProperty(exports, "__esModule", { value: true });
const server_1 = __importDefault(require("./models/server"));
const dotenv_1 = __importDefault(require("dotenv"));
const express_1 = __importDefault(require("express"));
const morgan_1 = __importDefault(require("morgan"));
// Configuramos dot.env
dotenv_1.default.config();
const server = new server_1.default();
server.listen();
const app = (0, express_1.default)();
app.use((0, morgan_1.default)('combined'));
