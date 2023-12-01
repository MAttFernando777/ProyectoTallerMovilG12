import { Request, Response} from 'express';
import connection from '../db/connection';

export const getTramites = (req: Request, res: Response) => {
  
    connection.query('SELECT * FROM tramite', (err, data) => {
      if(err) throw err;
      res.json(data)
    })
  }
  
  export const getTramite = (req: Request, res: Response) => {
    const { id } = req.params
    connection.query('SELECT * FROM tramite WHERE id = ?', id, (err, data) => {
      if(err) throw err;
      res.json(data[0])
    })
  }
  
  export const deleteTramite = (req: Request, res: Response) => {
    const { id } = req.params
  
    connection.query('DELETE FROM tramite WHERE id = ?', id, (err, data) => {
      if(err) throw err;
      res.json({
        msg: "Tramite eliminado con éxito"
      })
    })
  }
  
  export const postTramite = (req: Request, res: Response) => {
    const { body } = req;
  
    connection.query('INSERT INTO tramite set ?',[body], (err, data) => {
      if(err) throw err;
      res.json({
        msg: "Tramite agregado con éxito"
      })
    })
  }
  
  export const putTramite = (req: Request, res: Response) => {
    const { body } = req;
    const { id } = req.params
  
    connection.query('UPDATE tramite set ? WHERE id = ?', [body, id], (err, data) => {
      if(err) throw err;
      res.json({
        msg: "Tramite actualizado con éxito"
      })
    })
  }