import express, {Application} from 'express';
import routesPacientes from '../routes/paciente.routes'
import routesConvocatorias from '../routes/convocatoria.routes'
import connection from '../db/connection';
import cors from 'cors';
import morgan from 'morgan';


class Server {
  private app: Application;
  private port: string;
  
  constructor() {
    this.app = express();
    this.port = process.env.PORT || ' 4000';
    this.middlewares();
    this.app.use(morgan('combined'));
    this.routes();
    this.conectarDB();
  }

  listen() {
    this.app.listen(this.port, () => {
      console.log('Aplicacion corriendo por el puerto ', this.port);
    })
  }

  middlewares() {
    //Parseo del body
    this.app.use(express.json());

    //Cors
    this.app.use(cors()); 
  }

  routes() {
    this.app.use('/api/pacientes', routesPacientes);
    this.app.use('/api/convocatorias', routesConvocatorias);
  }

  conectarDB() {
    connection.connect((err) => {
      if(err) throw err;
      console.log('Conectado a la base de datos')
    })
  }
}

export default Server;