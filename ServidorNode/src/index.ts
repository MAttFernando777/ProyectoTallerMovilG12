import Server from "./models/server";
import dotenv from 'dotenv';
import express from 'express';
import morgan from 'morgan';

// Configuramos dot.env
dotenv.config();

const server = new Server();

server.listen();

const app = express();
app.use(morgan('combined'));