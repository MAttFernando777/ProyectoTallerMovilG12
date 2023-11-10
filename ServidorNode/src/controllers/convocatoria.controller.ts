import { Request, Response} from 'express';
import connection from '../db/connection';

export const getConvocatorias = (req: Request, res: Response) => {
  
    connection.query('SELECT * FROM convocatoria', (err, data) => {
      if(err) throw err;
      res.json(data)
    })
  }
  
  export const getConvocatoria = (req: Request, res: Response) => {
    const { id } = req.params
    connection.query('SELECT * FROM convocatoria WHERE id = ?', id, (err, data) => {
      if(err) throw err;
      res.json(data[0])
    })
  }
  
  export const deleteConvocatoria = (req: Request, res: Response) => {
    const { id } = req.params
  
    connection.query('DELETE FROM convocatoria WHERE id = ?', id, (err, data) => {
      if(err) throw err;
      res.json({
        msg: "Convocatoria eliminada con éxito"
      })
    })
  }
  
  export const postConvocatoria = (req: Request, res: Response) => {
    const { body } = req;
  
    connection.query('INSERT INTO convocatoria set ?',[body], (err, data) => {
      if(err) throw err;
      res.json({
        msg: "Convocatoria agregada con éxito"
      })
    })
  }
  
  export const putConvocatoria = (req: Request, res: Response) => {
    const { body } = req;
    const { id } = req.params
  
    connection.query('UPDATE convocatoria set ? WHERE id = ?', [body, id], (err, data) => {
      if(err) throw err;
      res.json({
        msg: "Convocatoria actualizada con éxito"
      })
    })
  }