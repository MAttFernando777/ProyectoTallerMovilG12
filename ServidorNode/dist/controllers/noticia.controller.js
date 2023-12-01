"use strict";
var __importDefault = (this && this.__importDefault) || function (mod) {
    return (mod && mod.__esModule) ? mod : { "default": mod };
};
Object.defineProperty(exports, "__esModule", { value: true });
exports.putNoticia = exports.postNoticia = exports.deleteNoticia = exports.getNoticia = exports.getNoticias = void 0;
const connection_1 = __importDefault(require("../db/connection"));
const getNoticias = (req, res) => {
    connection_1.default.query('SELECT * FROM noticia', (err, data) => {
        if (err)
            throw err;
        res.json(data);
    });
};
exports.getNoticias = getNoticias;
const getNoticia = (req, res) => {
    const { id } = req.params;
    connection_1.default.query('SELECT * FROM noticia WHERE id = ?', id, (err, data) => {
        if (err)
            throw err;
        res.json(data[0]);
    });
};
exports.getNoticia = getNoticia;
const deleteNoticia = (req, res) => {
    const { id } = req.params;
    connection_1.default.query('DELETE FROM noticia WHERE id = ?', id, (err, data) => {
        if (err)
            throw err;
        res.json({
            msg: "Noticia eliminada con éxito"
        });
    });
};
exports.deleteNoticia = deleteNoticia;
const postNoticia = (req, res) => {
    const { body } = req;
    connection_1.default.query('INSERT INTO noticia set ?', [body], (err, data) => {
        if (err)
            throw err;
        res.json({
            msg: "Noticia agregada con éxito"
        });
    });
};
exports.postNoticia = postNoticia;
const putNoticia = (req, res) => {
    const { body } = req;
    const { id } = req.params;
    connection_1.default.query('UPDATE noticia set ? WHERE id = ?', [body, id], (err, data) => {
        if (err)
            throw err;
        res.json({
            msg: "Noticia actualizada con éxito"
        });
    });
};
exports.putNoticia = putNoticia;
