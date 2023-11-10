"use strict";
var __importDefault = (this && this.__importDefault) || function (mod) {
    return (mod && mod.__esModule) ? mod : { "default": mod };
};
Object.defineProperty(exports, "__esModule", { value: true });
const express_1 = __importDefault(require("express"));
const paciente_routes_1 = __importDefault(require("../routes/paciente.routes"));
const convocatoria_routes_1 = __importDefault(require("../routes/convocatoria.routes"));
const connection_1 = __importDefault(require("../db/connection"));
const cors_1 = __importDefault(require("cors"));
const morgan_1 = __importDefault(require("morgan"));
class Server {
    constructor() {
        this.app = (0, express_1.default)();
        this.port = process.env.PORT || ' 4000';
        this.middlewares();
        this.app.use((0, morgan_1.default)('combined'));
        this.routes();
        this.conectarDB();
    }
    listen() {
        this.app.listen(this.port, () => {
            console.log('Aplicacion corriendo por el puerto ', this.port);
        });
    }
    middlewares() {
        //Parseo del body
        this.app.use(express_1.default.json());
        //Cors
        this.app.use((0, cors_1.default)());
    }
    routes() {
        this.app.use('/api/pacientes', paciente_routes_1.default);
        this.app.use('/api/convocatorias', convocatoria_routes_1.default);
    }
    conectarDB() {
        connection_1.default.connect((err) => {
            if (err)
                throw err;
            console.log('Conectado a la base de datos');
        });
    }
}
exports.default = Server;
