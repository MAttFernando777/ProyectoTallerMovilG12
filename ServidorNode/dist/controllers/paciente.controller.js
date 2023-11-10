"use strict";
var __importDefault = (this && this.__importDefault) || function (mod) {
    return (mod && mod.__esModule) ? mod : { "default": mod };
};
Object.defineProperty(exports, "__esModule", { value: true });
exports.putPaciente = exports.postPaciente = exports.deletePaciente = exports.getPaciente = exports.getDepartamentos = exports.getPacientes = void 0;
const connection_1 = __importDefault(require("../db/connection"));
const getPacientes = (req, res) => {
    connection_1.default.query('SELECT * FROM paciente', (err, data) => {
        if (err)
            throw err;
        res.json(data);
    });
};
exports.getPacientes = getPacientes;
const getDepartamentos = (req, res) => {
    connection_1.default.query('SELECT * FROM departamento', (err, data) => {
        if (err)
            throw err;
        res.json(data);
    });
};
exports.getDepartamentos = getDepartamentos;
const getPaciente = (req, res) => {
    const { id } = req.params;
    connection_1.default.query('SELECT * FROM paciente WHERE id = ?', id, (err, data) => {
        if (err)
            throw err;
        res.json(data[0]);
    });
};
exports.getPaciente = getPaciente;
const deletePaciente = (req, res) => {
    const { id } = req.params;
    connection_1.default.query('DELETE FROM paciente WHERE id = ?', id, (err, data) => {
        if (err)
            throw err;
        res.json({
            msg: "Paciente eliminado con éxito"
        });
    });
};
exports.deletePaciente = deletePaciente;
const postPaciente = (req, res) => {
    const { body } = req;
    connection_1.default.query('INSERT INTO paciente set ?', [body], (err, data) => {
        if (err)
            throw err;
        res.json({
            msg: "Paciente agregado con éxito"
        });
    });
};
exports.postPaciente = postPaciente;
const putPaciente = (req, res) => {
    const { body } = req;
    const { id } = req.params;
    connection_1.default.query('UPDATE paciente set ? WHERE id = ?', [body, id], (err, data) => {
        if (err)
            throw err;
        res.json({
            msg: "Persona actualizada con éxito"
        });
    });
};
exports.putPaciente = putPaciente;
