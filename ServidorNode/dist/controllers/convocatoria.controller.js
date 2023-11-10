"use strict";
var __importDefault = (this && this.__importDefault) || function (mod) {
    return (mod && mod.__esModule) ? mod : { "default": mod };
};
Object.defineProperty(exports, "__esModule", { value: true });
exports.putConvocatoria = exports.postConvocatoria = exports.deleteConvocatoria = exports.getConvocatoria = exports.getConvocatorias = void 0;
const connection_1 = __importDefault(require("../db/connection"));
const getConvocatorias = (req, res) => {
    connection_1.default.query('SELECT * FROM convocatoria', (err, data) => {
        if (err)
            throw err;
        res.json(data);
    });
};
exports.getConvocatorias = getConvocatorias;
const getConvocatoria = (req, res) => {
    const { id } = req.params;
    connection_1.default.query('SELECT * FROM convocatoria WHERE id = ?', id, (err, data) => {
        if (err)
            throw err;
        res.json(data[0]);
    });
};
exports.getConvocatoria = getConvocatoria;
const deleteConvocatoria = (req, res) => {
    const { id } = req.params;
    connection_1.default.query('DELETE FROM convocatoria WHERE id = ?', id, (err, data) => {
        if (err)
            throw err;
        res.json({
            msg: "Convocatoria eliminada con éxito"
        });
    });
};
exports.deleteConvocatoria = deleteConvocatoria;
const postConvocatoria = (req, res) => {
    const { body } = req;
    connection_1.default.query('INSERT INTO convocatoria set ?', [body], (err, data) => {
        if (err)
            throw err;
        res.json({
            msg: "Convocatoria agregada con éxito"
        });
    });
};
exports.postConvocatoria = postConvocatoria;
const putConvocatoria = (req, res) => {
    const { body } = req;
    const { id } = req.params;
    connection_1.default.query('UPDATE convocatoria set ? WHERE id = ?', [body, id], (err, data) => {
        if (err)
            throw err;
        res.json({
            msg: "Convocatoria actualizada con éxito"
        });
    });
};
exports.putConvocatoria = putConvocatoria;
